package oop;

public class SinhVien {

    private String ten;
    private float toan;
    private float van ;

    public SinhVien() {
    }

    public SinhVien(String ten, float toan, float van) {
        this.ten = ten;
        this.toan = toan;
        this.van = van;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public float getToan() {
        return toan;
    }

    public void setToan(float toan) {
        this.toan = toan;
    }

    public float getVan() {
        return van;
    }

    public void setVan(float van) {
        this.van = van;
    }

    public float dtb(){
        return (toan + van) / 2;
    }

    public float dtb(SinhVien a){
        return (this.dtb()+a.dtb())/2;
    }

    @Override
    public String toString() {
        return "SinhVien{" +
                "ten='" + ten + '\'' +
                ", toan=" + toan +
                ", van=" + van +
                '}';
    }
}
