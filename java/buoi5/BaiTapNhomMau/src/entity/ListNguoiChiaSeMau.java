package entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

public class ListNguoiChiaSeMau {
    List<Nguoi> listNguoiChiaSeMau;
    public ListNguoiChiaSeMau() {
        listNguoiChiaSeMau = new ArrayList<>();
    }
    public void them1Nguoi(Nguoi nguoi){
        listNguoiChiaSeMau.add(nguoi);
    }
    public void themNhieuNguoi(int n){
        Scanner scanner = new Scanner(System.in);
        System.out.println("Có 4 nhóm máu: 1.A, 2.B, 3.AB, 4.O");
        System.out.println("Có 2 loại Rh: 1 + , 2 -");

        for (int i = 0; i < n; i++) {

            System.out.println("nhap thong tin nguoi thu " + (i + 1));
            System.out.println("Nhap nhom mau: ");
            int nhomMau = scanner.nextInt();
            System.out.println("Nhap Rh: ");
            int rh = scanner.nextInt();
            if(nhomMau==1){
                if(rh==1){
                    Nguoi nguoi = new Nguoi(NhomMau.A, Rh.RhDuong);
                    listNguoiChiaSeMau.add(nguoi);
                }
                else{
                    Nguoi nguoi = new Nguoi(NhomMau.A, Rh.RhAm);
                    listNguoiChiaSeMau.add(nguoi);
                }
            }
            if(nhomMau==2){
                if(rh==1){
                    Nguoi nguoi = new Nguoi(NhomMau.B, Rh.RhDuong);
                    listNguoiChiaSeMau.add(nguoi);
                }
                else{
                    Nguoi nguoi = new Nguoi(NhomMau.B, Rh.RhAm);
                    listNguoiChiaSeMau.add(nguoi);
                }
            }
            if(nhomMau==3){
                if(rh==1){
                    Nguoi nguoi = new Nguoi(NhomMau.AB, Rh.RhDuong);
                    listNguoiChiaSeMau.add(nguoi);
                }
                else{
                    Nguoi nguoi = new Nguoi(NhomMau.AB, Rh.RhAm);
                    listNguoiChiaSeMau.add(nguoi);
                }
            }
            if(nhomMau==4){
                if(rh==1){
                    Nguoi nguoi = new Nguoi(NhomMau.O, Rh.RhDuong);
                    listNguoiChiaSeMau.add(nguoi);
                }

                else{
                    Nguoi nguoi = new Nguoi(NhomMau.O, Rh.RhAm);
                    listNguoiChiaSeMau.add(nguoi);
                }
            }



        }


    }
    public void cau3(){
        System.out.println("nhap vi tri nguoi can kiem tra");
        Scanner scanner = new Scanner(System.in);
        int index = scanner.nextInt();
        for( int i =0 ; i<listNguoiChiaSeMau.size();i++){
            if(i!=(index-1)){
                if(listNguoiChiaSeMau.get((index-1)).checkMauNhan(listNguoiChiaSeMau.get(i))&&listNguoiChiaSeMau.get((index-1)).checkRhNhan(listNguoiChiaSeMau.get(i))){
                    System.out.println("Nguoi thu "+(index)+" co the nhan mau cho nguoi thu "+(i+1));
                }
                else{
                    System.out.println("Nguoi thu "+(index)+" khong the nhan mau cho nguoi thu "+(i+1));
                }
            }
        }



    }

    public void xuat() {
      for(Nguoi ng : listNguoiChiaSeMau){
          System.out.println("Người thứ "+(listNguoiChiaSeMau.indexOf(ng)+1));
          System.out.println(ng.toString());
      }

    }
}
