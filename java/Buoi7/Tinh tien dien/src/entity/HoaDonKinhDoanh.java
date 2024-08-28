package entity;

public class HoaDonKinhDoanh extends HoaDon{
    private LinhVucKinhDoanh linhVucKinhDoanh;

    public HoaDonKinhDoanh() {
    }

    public HoaDonKinhDoanh(String maKH, String tenKH, int chiSoCu, int chiSoMoi, LinhVucKinhDoanh linhVucKinhDoanh) {
        super(maKH, tenKH, chiSoCu, chiSoMoi);
        this.linhVucKinhDoanh = linhVucKinhDoanh;

    }

    public LinhVucKinhDoanh getLinhVucKinhDoanh() {
        return linhVucKinhDoanh;
    }

    public void setLinhVucKinhDoanh(LinhVucKinhDoanh linhVucKinhDoanh) {
        this.linhVucKinhDoanh = linhVucKinhDoanh;
    }

    @Override
    public long tienDien() {
        long tongTien = 0;
        int soDien = getChiSoMoi() - getChiSoCu();
        tongTien = soDien * 3000;
        if(linhVucKinhDoanh== LinhVucKinhDoanh.CTY_NN){
            this.tienThanhToan = (long) (tongTien*1.05);
            return (long) (tongTien*1.05);
        }
        else{
            this.tienThanhToan = (long) (tongTien*1.1);
            return (long) (tongTien*1.1);
        }


    }

    @Override
    public String toString() {
        return "HoaDonKinhDoanh{" +
                "linhVucKinhDoanh=" + linhVucKinhDoanh +
                ", maKH='" + maKH + '\'' +
                ", tenKH='" + tenKH + '\'' +
                ", chiSoCu=" + chiSoCu +
                ", chiSoMoi=" + chiSoMoi +
                ", tienThanhToan=" + tienThanhToan +
                '}';
    }
}
