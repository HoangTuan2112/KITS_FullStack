import java.util.List;

public class GoiDichVu {

    private float phiCoBanValue;
    private float chiPhiLopHocValue;
    private float dichVuXongHoiValue;
    private float hoTroPTValue;



    public GoiDichVu() {
    }

    public GoiDichVu(float chiPhiLopHocValue, float phiCoBanValue, float dichVuXongHoiValue, float hoTroPTValue) {
        this.chiPhiLopHocValue = chiPhiLopHocValue;
        this.phiCoBanValue = phiCoBanValue;
        this.dichVuXongHoiValue = dichVuXongHoiValue;
        this.hoTroPTValue = hoTroPTValue;

    }

    public GoiDichVu(float phiCoBanValue, float chiPhiLopHocValue, float hoTroPTValue) {
        this.phiCoBanValue = phiCoBanValue;
        this.chiPhiLopHocValue = chiPhiLopHocValue;
        this.hoTroPTValue = hoTroPTValue;



    }

    public GoiDichVu(float phiCoBanValue, float hoTroPTValue) {
        this.phiCoBanValue = phiCoBanValue;
        this.hoTroPTValue = hoTroPTValue;

    }

    public float getPhiCoBanValue() {
        return phiCoBanValue;
    }

    public void setPhiCoBanValue(float phiCoBanValue) {
        this.phiCoBanValue = phiCoBanValue;
    }

    public float getDichVuXongHoiValue() {
        return dichVuXongHoiValue;
    }

    public void setDichVuXongHoiValue(float dichVuXongHoiValue) {
        this.dichVuXongHoiValue = dichVuXongHoiValue;
    }

    public float getChiPhiLopHocValue() {
        return chiPhiLopHocValue;
    }

    public void setChiPhiLopHocValue(float chiPhiLopHocValue) {
        this.chiPhiLopHocValue = chiPhiLopHocValue;
    }

    public float getHoTroPTValue() {
        return hoTroPTValue;
    }

    public void setHoTroPTValue(float hoTroPTValue) {
        this.hoTroPTValue = hoTroPTValue;
    }



    @Override
    public String toString() {
        return "GoiDichVu{" +
                ", phiCoBanValue=" + phiCoBanValue +
                ", chiPhiLopHocValue=" + chiPhiLopHocValue +
                ", dichVuXongHoiValue=" + dichVuXongHoiValue +
                ", hoTroPTValue=" + hoTroPTValue +

                '}';
    }

}
