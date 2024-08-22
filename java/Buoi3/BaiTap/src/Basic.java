import java.util.List;

public class Basic extends GoiDichVu {
    public Basic( ) {
        super(500, 100, 100);

    }


    @Override
    public String toString() {
        return "GoiDichVuBasic{" +
                "phiCoBanValue=" + getPhiCoBanValue() +
                ", chiPhiLopHocValue=" + getChiPhiLopHocValue() +
                ", hoTroPTValue=" + getHoTroPTValue() +

                '}';
    }
}
