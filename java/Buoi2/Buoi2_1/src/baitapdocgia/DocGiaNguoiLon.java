package baitapdocgia;

import java.util.Scanner;

public class DocGiaNguoiLon extends DocGia {
    private String cmnd;

    public DocGiaNguoiLon() {
    }
    public DocGiaNguoiLon(int soThang, long gia, String cmnd) {
        super(soThang, gia);
        setGia(10000);

        this.cmnd = cmnd;
    }

    public String getCmnd() {
        return cmnd;
    }

    public void setCmnd(String cmnd) {
        this.cmnd = cmnd;
    }

    @Override
    public void nhap() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhap cmnd: ");
        setCmnd(sc.nextLine());
        setGia(10000);
        super.nhap();
    }

    @Override
    public float tinhtien() {
        return getSoThang() * getGia();
    }

    @Override
    public String toString() {
        return "DocGiaNguoiLon{" +
                "cmnd='" + cmnd + '\'' +
                "soThang=" + getSoThang() + " gia=" + getGia() +
                " tien=" + tinhtien() +
                '}';
    }
}
