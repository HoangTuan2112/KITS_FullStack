public class KhachHang {

    private String hoTen;
    private String cmnd;
    private int thang;

    public KhachHang() {

    }

    public KhachHang(String cmnd, String hoTen, int thang) {
        this.cmnd = cmnd;
        this.hoTen = hoTen;
        this.thang = thang;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getCmnd() {
        return cmnd;
    }

    public void setCmnd(String cmnd) {
        this.cmnd = cmnd;
    }

    public int getThang() {
        return thang;
    }

    public void setThang(int thang) {
        this.thang = thang;
    }

    @Override
    public String toString() {
        return "KhachHang{" +
                "hoTen='" + hoTen + '\'' +
                ", cmnd='" + cmnd + '\'' +
                ", thang=" + thang +
                '}';
    }
}
