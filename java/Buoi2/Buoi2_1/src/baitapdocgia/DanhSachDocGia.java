package baitapdocgia;

import java.util.ArrayList;
import java.util.List;

public class DanhSachDocGia {
    private List<DocGia> listDocGia;

    public DanhSachDocGia() {
        listDocGia = new ArrayList<>();
    }
    public void menu(){
        System.out.println("1. Doc gia tre em");
        System.out.println("2. Doc gia nguoi lon");
        System.out.println("3. Xuat");
        System.out.println("4. Tong tien");
        System.out.println("5. So doc gia tre em");
        System.out.println("6. Thoat");
        while (true){
            int choose = 0;


            System.out.println("=======================");
            System.out.println("Nhap lua chon: ");
            choose = new java.util.Scanner(System.in).nextInt();
            if(choose==1){
                DocGia docGia = new DocGiaTreEm();
                docGia.nhap();
                listDocGia.add(docGia);

            }
            if(choose==2){
                DocGia docGia = new DocGiaNguoiLon();
                docGia.nhap();
                listDocGia.add(docGia);
            }
            if(choose==3){
                if(listDocGia.size() == 0){
                    System.out.println("Chua co doc gia nao");
                }
                else
                    xuat();
            }
            if(choose==4){
                System.out.println("Tong tien: " + tongTien());
            }
            if(choose==5){
                System.out.println("So doc gia tre em: " + countTreEm());
            }
            if(choose == 6){
                break;
            }

        }
    }
    public void xuat(){
        for (DocGia docGia : listDocGia) {
            docGia.xuat();
        }
    }
    public long tongTien(){
        long sum = 0;
        for (DocGia docGia : listDocGia) {
            sum += docGia.tinhtien();
        }
        return sum;
    }

    public int countTreEm(){
        int count = 0;
        for (DocGia docGia : listDocGia) {
            if(docGia instanceof DocGiaTreEm){
                count++;
            }
        }
        return count;
    }
}
