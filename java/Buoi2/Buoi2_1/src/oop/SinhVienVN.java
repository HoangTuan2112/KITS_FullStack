package oop;

public class SinhVienVN extends SinhVien implements Nguoi {

    @Override
    public boolean totNghiep12() {
        return true;
    }

    @Override
    public boolean hatHay() {
        return true;
    }

    private float trietHoc;

    public SinhVienVN() {
    }

    public SinhVienVN(String ten, float toan, float van, float trietHoc) {
        super(ten, toan, van);
        this.trietHoc = trietHoc;
    }

    public float getTrietHoc() {
        return trietHoc;
    }

    public void setTrietHoc(float trietHoc) {
        this.trietHoc = trietHoc;
    }

    @Override
    public String toString() {

        return "SinhVienVN{" +
                "ten='" + getTen() + '\'' +
                ", toan=" + getToan() +
                ", van=" + getVan() +
                ", trietHoc=" + trietHoc +
                '}';

    }
}
