import java.util.InputMismatchException;
import java.util.Scanner;

public class BaiTap1 {
    public static void main(String[] args) {
        int a = 0;
        int b = 0;
        boolean flag = false;

        Scanner sc = new Scanner(System.in);
        while (!flag) {
            try {
                System.out.println("Nhap so a");
                a = sc.nextInt();
                flag = true;
            } catch (Exception e) {
                System.out.println("Loi nhap so a");
                sc.next();
            }
        }
        flag = false;
        while (!flag) {
            try {
                System.out.println("Nhap so b");
                b = sc.nextInt();
                flag = true;
            } catch (Exception e) {
                System.out.println("Loi nhap so b");
                sc.next();
            }

        }
        System.out.println("tong " + tong(a, b));
        System.out.println("hieu " + hieu(a, b));
        System.out.println("tich " + tich(a, b));
        System.out.println("thuong " + thuong(a, b));
        System.out.println("mod " + chiaLayDu(a, b));


        sc.close();


    }

    public static int tong(int a, int b) {
        int result = 0;
        result = a + b;
        return result;
    }

    public static int hieu(int a, int b) {
        int result = 0;
        result = a - b;
        return result;
    }

    public static int tich(int a, int b) {
        int result = 0;
        result = a * b;
        return result;
    }

    public static float thuong(int a, int b) {
        float result = 0;
        result = (float) a / b;
        return result;
    }

    public static int chiaLayDu(int a, int b) {
        int result = 0;
        result = a % b;
        return result;
    }
}
