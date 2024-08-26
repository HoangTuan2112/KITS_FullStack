import entity.*;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nguyen lieu ga ham tao do: ga , hat sen, ca rot, tao do, nam dong co");
        System.out.println("nhap khoi luong(g) ga: ");
        float khoiLuongGa = scanner.nextFloat();
        System.out.println("nhap khoi luong(g) hat sen: ");
        float khoiLuongHatSen = scanner.nextFloat();
        System.out.println("nhap khoi luong(g) ca rot: ");
        float khoiLuongCaRot = scanner.nextFloat();
        System.out.println("nhap khoi luong(g) tao do: ");
        float khoiLuongTaoDo = scanner.nextFloat();
        System.out.println("nhap khoi luong(g) nam dong co: ");
        float khoiLuongNamDongCo = scanner.nextFloat();
        ThucPham ga = new Ga(khoiLuongGa);
        ThucPham hatSen = new HatSen(khoiLuongHatSen);
        ThucPham caRot = new CaRot(khoiLuongCaRot);
        ThucPham taoDo = new TaoDo(khoiLuongTaoDo);
        ThucPham namDongCo = new NamDongCo(khoiLuongNamDongCo);
        ThucPham gaHamTaoDo = new GaHamTaoDo(ga, taoDo, hatSen, caRot, namDongCo);
        System.out.println("Thong tin dinh duong ga ham tao do");
        System.out.println(gaHamTaoDo.toString());

        float chuanCarb=0;
        float chuanFat=0;
        float chuanFatBaoHoa=0;
        float chuanProtein=0;
        float chuanCalo=0;
        System.out.println("Nhap chuan carb: ");
        chuanCarb = scanner.nextFloat();
        System.out.println("Nhap chuan fat: ");
        chuanFat = scanner.nextFloat();
        System.out.println("Nhap chuan fat bao hoa: ");
        chuanFatBaoHoa = scanner.nextFloat();
        System.out.println("Nhap chuan protein: ");
        chuanProtein = scanner.nextFloat();
        System.out.println("Nhap chuan calo: ");
        chuanCalo = scanner.nextFloat();

        gaHamTaoDo.boSungChatGi(chuanCarb, chuanFat, chuanFatBaoHoa, chuanProtein, chuanCalo);
        System.out.println("So phut can chay bo khi calo >600 la "+gaHamTaoDo.thoiGianDotCalo(gaHamTaoDo.duCalo()));
        scanner.close();



    }
}