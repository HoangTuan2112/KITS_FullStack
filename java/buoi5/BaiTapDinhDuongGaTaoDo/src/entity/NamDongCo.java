package entity;

public class NamDongCo extends ThucPham{
    private float
 khoiLuong;

    public NamDongCo(float
 khoiLuong) {
        super(1*khoiLuong/100, 0*khoiLuong/100, 0*khoiLuong/100, 15*khoiLuong/100, 10*khoiLuong/100);
        this.khoiLuong = khoiLuong;
    }

    public float
 getKhoiLuong() {
        return khoiLuong;
    }

    public void setKhoiLuong(float
 khoiLuong) {
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
