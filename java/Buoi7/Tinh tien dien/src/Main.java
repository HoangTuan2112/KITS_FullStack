import entity.DanhSachHoaDon;
import entity.HoaDon;
import entity.HoaDonKinhDoanh;
import entity.LinhVucKinhDoanh;

public class Main {
    public static void main(String[] args) {
//        HoaDon hd1 = new HoaDon("KH01", "Nguyen Van A", 100, 250);
//
//        HoaDon hd2 = new HoaDonKinhDoanh("KH02", "Nguyen Van B", 100, 150, LinhVucKinhDoanh.CTY_TN);
//        System.out.println(hd1.toString());
//        System.out.println(hd2.toString());
        DanhSachHoaDon ds = new DanhSachHoaDon();
        //cau 1
        ds.nhapNHoaDon();
        // end cau 1

        //  cau 2
        ds.xuat();
        // end cau 2

        // cau 3
        System.out.println("tong tien trong danh sach "+ ds.tongTien());
        // end cau 3

        //cau 4
        System.out.println("So kw tieu thu nhieu nhat: "+ ds.maxTieuThu());
        System.out.println("Cac ho kinh doanh  tieu thu dien  nhieu nhat: ");
        ds.cau4().stream().forEach(hoaDon -> System.out.println(hoaDon.toString()));
        // end cau 4

    }
}