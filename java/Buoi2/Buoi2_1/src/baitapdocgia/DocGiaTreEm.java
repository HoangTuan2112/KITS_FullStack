package baitapdocgia;

import java.util.Scanner;

public class DocGiaTreEm extends  DocGia{
    private String hoTenNguoiDaiDien;

    public DocGiaTreEm() {
    }

    public DocGiaTreEm(int soThang, long gia, String hoTenNguoiDaiDien) {
        super(soThang, gia);
        setGia(5000);
        this.hoTenNguoiDaiDien = hoTenNguoiDaiDien;
    }

    public String getHoTenNguoiDaiDien() {
        return hoTenNguoiDaiDien;
    }

    public void setHoTenNguoiDaiDien(String hoTenNguoiDaiDien) {
        this.hoTenNguoiDaiDien = hoTenNguoiDaiDien;
    }

    @Override
    public void nhap() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhap ho ten nguoi dai dien: ");
        setHoTenNguoiDaiDien(sc.nextLine());
        setGia(5000);
        super.nhap();
    }

    @Override
    public void xuat() {
        System.out.println(toString());
    }

    @Override
    public float tinhtien() {
        return getSoThang() * getGia();
    }

    @Override
    public String toString() {
        return "DocGiaTreEm{" +
                "hoTenNguoiDaiDien='" + hoTenNguoiDaiDien + '\'' +
                "soThang=" + getSoThang() + " gia=" + getGia() +" tien=" + tinhtien() +
                '}';
    }
}
