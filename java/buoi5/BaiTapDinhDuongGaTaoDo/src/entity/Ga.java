package entity;

public class Ga extends ThucPham{
    private float khoiLuong;

    public Ga( float khoiLuong) {
        super(0*khoiLuong/100, 15*khoiLuong/100, 4*khoiLuong/100, 17*khoiLuong/100, 211*khoiLuong/100);
        this.khoiLuong = khoiLuong;
    }

    public float getKhoiLuong() {
        return khoiLuong;
    }

    public void setKhoiLuong(float khoiLuong) {
        this.khoiLuong = khoiLuong;
    }

    @Override
    public String toString() {
        return "ThucPham{" +
                "carb=" + getCarb() +
                ", fat=" + getFat() +
                ", fatBaoHoa=" + getFatBaoHoa() +
                ", protein=" + getProtein() +
                ", calo=" + getCalo() +
                ", khoiLuong=" + khoiLuong +
                '}';
    }
}
