import java.util.List;

public class NonMember extends GoiDichVu {
    public NonMember() {
        super(200, 200);
    }
    @Override
    public String toString() {
        return "GoiDichVuNonMember{" +
                "phiCoBanValue=" + getPhiCoBanValue() +
                ", hoTroPTValue=" + getHoTroPTValue() +

                '}';
    }
}
