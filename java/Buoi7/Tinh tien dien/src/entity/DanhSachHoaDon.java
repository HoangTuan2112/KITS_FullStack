package entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class DanhSachHoaDon {
    private List<HoaDon> danhSachHoaDon;

    public DanhSachHoaDon() {
        danhSachHoaDon = new ArrayList<>();
    }
    public void nhapNHoaDon(){
        Scanner scanner = new Scanner(System.in);
        System.out.println("nhap so luong hoa don: ");
        int n = scanner.nextInt();
        HoaDon hoaDon = null;
        for (int i = 0; i < n; i++) {
            System.out.println("nhap loai hoa don: 1: hoa don thuong, 2: hoa don kinh doanh");
            int loai = scanner.nextInt();
            if(loai==1){
                hoaDon= new HoaDon();
                System.out.println("nhap ma khach hang: ");
                hoaDon.setMaKH(scanner.next());

                System.out.println("nhap ten khach hang: ");
                hoaDon.setTenKH(scanner.next());
                System.out.println("nhap chi so cu: ");
                hoaDon.setChiSoCu(scanner.nextInt());
                System.out.println("nhap chi so moi: ");
                hoaDon.setChiSoMoi(scanner.nextInt());
                hoaDon.tienDien();
                danhSachHoaDon.add(hoaDon);
            }
            else if(loai==2){
                hoaDon= new HoaDonKinhDoanh();
                System.out.println("nhap ma khach hang: ");
                hoaDon.setMaKH(scanner.next());
                System.out.println("nhap ten khach hang: ");
                hoaDon.setTenKH(scanner.next());
                System.out.println("nhap chi so cu: ");
                hoaDon.setChiSoCu(scanner.nextInt());
                System.out.println("nhap chi so moi: ");
                hoaDon.setChiSoMoi(scanner.nextInt());
                hoaDon.tienDien();
                System.out.println("Nhap linh vuc kinh doan 1.NHA_HANG,2.KHACH_SAN, 3.CTY_TN,4.CTY_NN");
                int lv = scanner.nextInt();
                ((HoaDonKinhDoanh) hoaDon).setLinhVucKinhDoanh(LinhVucKinhDoanh.values()[lv-1]);
                hoaDon.tienDien();
                danhSachHoaDon.add(hoaDon);
            }

            scanner.close();
        }
    }

   public void xuat(){
       System.out.println("Danh sach hoa don: ");
        for (HoaDon hoaDon : danhSachHoaDon) {
            System.out.println(hoaDon.toString());
        }
    }

    public long tongTien(){
        long tongTien = 0;
        for (HoaDon hoaDon : danhSachHoaDon) {
            tongTien += hoaDon.tienDien();
        }
        return tongTien;
    }
    public long maxTieuThu(){
        long max = 0;
        for(HoaDon hd: danhSachHoaDon){
            if( hd instanceof  HoaDonKinhDoanh){
                if((hd.getChiSoMoi()-hd.getChiSoCu())>max){
                    max = hd.getChiSoMoi()-hd.getChiSoCu();
                }
            }
        }
        return max;
    }
    public List<HoaDon> cau4(){
        List<HoaDon> hoaDon = new ArrayList<>();

        for(HoaDon hd: danhSachHoaDon){
          if( hd instanceof  HoaDonKinhDoanh){
                if((hd.getChiSoMoi()-hd.getChiSoCu())==maxTieuThu()){
                    hoaDon.add(hd);
                }
          }
        }

        return hoaDon;
    }

    @Override
    public String toString() {
        return "DanhSachHoaDon{" +
                "danhSachHoaDon=" + danhSachHoaDon +
                '}';
   }
}
