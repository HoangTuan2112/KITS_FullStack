package entity;

public class HoaDon {
    protected String maKH;
    protected String tenKH;
    protected int chiSoCu;
    protected int chiSoMoi;
    protected long tienThanhToan;

    public HoaDon() {
    }

    public HoaDon(String maKH, String tenKH, int chiSoCu, int chiSoMoi) {
        this.maKH = maKH;
        this.tenKH = tenKH;
        this.chiSoCu = chiSoCu;
        this.chiSoMoi = chiSoMoi;

    }

    public long tienDien() {
        long tongTien = 0;
        int soDien = chiSoMoi - chiSoCu;
        if (soDien <= 50 && soDien > 0) {
            tongTien = soDien * 1500;
        } else if (soDien <= 100) {
            tongTien = 50 * 1500 + (soDien - 50) * 2000;
        } else
            tongTien = 50 * 1500 + 50 * 2000 + (soDien - 100) * 2800;


        this.tienThanhToan = (long) (tongTien*1.1);
        return (long) (tongTien*1.1);
    }

    public String getMaKH() {
        return maKH;
    }

    public void setMaKH(String maKH) {
        this.maKH = maKH;
    }

    public String getTenKH() {
        return tenKH;
    }

    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }

    public int getChiSoCu() {
        return chiSoCu;
    }

    public void setChiSoCu(int chiSoCu) {
        this.chiSoCu = chiSoCu;
    }

    public int getChiSoMoi() {
        return chiSoMoi;
    }

    public void setChiSoMoi(int chiSoMoi) {
        this.chiSoMoi = chiSoMoi;
    }

    public long getTienThanhToan() {
        return tienThanhToan;
    }

    public void setTienThanhToan(long tienThanhToan) {
        this.tienThanhToan = tienThanhToan;
    }

    @Override
    public String toString() {
        return "HoaDon{" +
                "maKH='" + maKH + '\'' +
                ", tenKH='" + tenKH + '\'' +
                ", chiSoCu=" + chiSoCu +
                ", chiSoMoi=" + chiSoMoi +
                ", tienThanhToan=" + tienThanhToan +
                '}';
    }
}
