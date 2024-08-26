package entity;

public class TaoDo extends ThucPham{
    private float
 khoiLuong;

    public TaoDo(float
 khoiLuong) {
        super(3*khoiLuong/100, 1*khoiLuong/100, 0*khoiLuong/100, 1*khoiLuong/100, 52*khoiLuong/100);
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
