import entity.*;

import java.sql.SQLOutput;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        //CAU 1
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhap so luong nguoi muon them:");
        ListNguoiChiaSeMau listNguoiChiaSeMau = new ListNguoiChiaSeMau();
        int n = scanner.nextInt();
        listNguoiChiaSeMau.themNhieuNguoi(n);
        listNguoiChiaSeMau.xuat();
        //END CAU 1

        //CAU 2
        Nguoi cha = new Nguoi(NhomMau.AB, Rh.RhDuong, Role.cha);
        Nguoi me = new Nguoi(NhomMau.O, Rh.RhDuong, Role.me);
        Nguoi con = new Nguoi(NhomMau.B, Rh.RhAm, Role.con);

        GiaDinh giaDinh = new GiaDinh();
        giaDinh.themThanhVien(Role.cha, cha);
        giaDinh.themThanhVien(Role.me, me);
        giaDinh.themThanhVien(Role.con, con);
        System.out.println(giaDinh.toString());
        if (giaDinh.kiemTraHuyetMach()) {
            System.out.println("DUNG ");
        } else
            System.out.println("SAI ");
        //END CAU 2

        //CAU 3

       listNguoiChiaSeMau.cau3();

        //END CAU 3


        scanner.close();
    }
}