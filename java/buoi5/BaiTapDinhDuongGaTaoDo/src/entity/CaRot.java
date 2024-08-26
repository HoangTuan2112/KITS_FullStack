package entity;

public class CaRot extends ThucPham{
    private float
 khoiLuong;

    public CaRot(float
 khoiLuong) {
        super(10*khoiLuong/100, 3*khoiLuong/100, 0*khoiLuong/100, 1*khoiLuong/100, 41);
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
