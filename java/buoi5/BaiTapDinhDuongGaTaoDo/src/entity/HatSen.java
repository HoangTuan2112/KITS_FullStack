package entity;

public class HatSen extends ThucPham{
    private float khoiLuong;

    public HatSen(float khoiLuong) {
        super(17*khoiLuong/100, 0*khoiLuong/100, 1*khoiLuong/100, 4*khoiLuong/100, 89*khoiLuong/100);
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
