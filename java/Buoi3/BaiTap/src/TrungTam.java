import java.util.HashMap;
import java.util.Scanner;

public class TrungTam {

    private HashMap<KhachHang,GoiDichVu> khachHangGoiDichVuHashMap = new HashMap<>();

    public HashMap<KhachHang, GoiDichVu> getKhachHangGoiDichVuHashMap() {

        return khachHangGoiDichVuHashMap;
    }
    public boolean addKhachHang(KhachHang khachHang, GoiDichVu goiDichVu){
        khachHangGoiDichVuHashMap.put(khachHang,goiDichVu);
        return true;
    }
    public float tinhTien(KhachHang khachHang){
//        GoiDichVu goiDichVu = khachHangGoiDichVuHashMap.get(khachHang);
//        return goiDichVu.tinhTien(khachHang);
        float tongTien = 0;

        return 0;
    }

    public void menu(){
        System.out.println("1. Nhap thong tin khach hang");
        System.out.println("2. Hien thi thong tin khach hang");
        System.out.println("3. Thoat");
        boolean flag = true;
        Scanner scanner = new Scanner(System.in);
        while (flag==true){

            int chon = scanner.nextInt();
            if(chon==1){
                nhap();
            }
            if(chon==2){
                System.out.println(khachHangGoiDichVuHashMap.toString());
                System.out.println("nhap lua chon");
            }
            if(chon==3){
                scanner.close();
                flag = false;

            }
        }
    }
    public void nhap(){
        String hoten;
        String cmnd;
        int thang;
       KhachHang khachHang = new KhachHang();
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhap ten khach hang: ");
        hoten = scanner.nextLine();
        khachHang.setHoTen(hoten);
        System.out.println("Nhap cmnd: ");
        cmnd = scanner.nextLine();
        khachHang.setCmnd(cmnd);
        System.out.println("Nhap thang: ");
        thang = scanner.nextInt();
        khachHang.setThang(thang);
        System.out.println("1.Preminum");
        System.out.println("2.Basic");
        System.out.println("3.NonMember");
        System.out.println("Chon goi dich vu: ");
        int chon = scanner.nextInt();

        if(chon==1){
            addKhachHang(khachHang,new Premium());

        }
        if(chon==2){
            addKhachHang(khachHang,new Basic());

        }
        if(chon==3){
            addKhachHang(khachHang,new NonMember());
        }
        menu();

    }

}
