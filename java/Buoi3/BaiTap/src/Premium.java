import java.util.List;

public class Premium extends GoiDichVu {

    public Premium() {
        super(0 , 1000, 0, 0);
    }
    @Override
    public String toString() {
        return "GoiDichVuPremium{" +
                "phiCoBanValue=" + getPhiCoBanValue() +
                ", chiPhiLopHocValue=" + getChiPhiLopHocValue() +
                ", hoTroPTValue=" + getHoTroPTValue() +
                ", dichVuXongHoiValue=" + getDichVuXongHoiValue() +

                '}';
    }

}
