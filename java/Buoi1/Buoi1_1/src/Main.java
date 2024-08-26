import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
//        Scanner scanner = new Scanner(System.in);
//
//        System.out.println("Nhap ten");
//        String ten = scanner.nextLine();
//
//        int tuoi = 0;
//        boolean flag = false;
//
//        while (!flag){
//            try {
//                System.out.println("Nhap tuoi");
//                tuoi = scanner.nextInt();
//                flag=true;
//            } catch (InputMismatchException e) {
//                System.out.println("Loi: vui long nhap so nguyen");
//                scanner.next();
//            }
//        }
//
//        System.out.println("Nhap chieu cao ");
//        double chieuCao = scanner.nextDouble();
//
//
//        System.out.println("Ten ban la "+ten);
//        System.out.println("Tuoi ban la "+tuoi);
//        System.out.println("Chieu bao ban la "+chieuCao);
//        scanner.close();
//        nhapXuat();
//        nhapXuat2();
        HinhChuNhat hcn = new HinhChuNhat(5, 3);
        System.out.printf("Hinh chu nhat co\n chieu dai la %f \n chieu rong la %f \n chu vi la %f \n dien tich la %f \n", hcn.dai, hcn.rong, hcn.chuVi(), hcn.dienTich());
    }


    public static int inputNumber(String name) {
        Scanner scanner = new Scanner(System.in);
        boolean valid = false;
        int value = 0;
        while (!valid) {
            try {
                System.out.printf("Nhap %s cua ban \n", name);

                value = scanner.nextInt();

                valid = true;
            } catch (Exception e) {
                System.out.println("Loi nhap");
                scanner.next();
            }
        }
        return value;
    }


    public static void nhapXuat() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhap ten");
        String name = scanner.nextLine();
        int age = 0;
        int height = 0;
        age = inputNumber("tuoi");
        height = inputNumber("chieu cao");
        System.out.printf("ten ban la %s %d tuoi %d cm ", name, age, height);
        scanner.close();

    }
    // phuong thuc check cung hoang dao
//    Bạch Dương (Aries): 21/3 - 19/4
//    Kim Ngưu (Taurus): 20/4 - 20/5
//    Song Tử (Gemini): 21/5 - 20/6
//    Cự Giải (Cancer): 21/6 - 22/7
//    Sư Tử (Leo): 23/7 - 22/8
//    Xử Nữ (Virgo): 23/8 - 22/9
//    Thiên Bình (Libra): 23/9 - 22/10
//    Bọ Cạp (Scorpio): 23/10 - 21/11
//    Nhân Mã (Sagittarius): 22/11 - 21/12
//    Ma Kết (Capricorn): 22/12 - 19/1
//    Bảo Bình (Aquarius): 20/1 - 18/2
//    Song Ngư (Pisces): 19/2 - 20/3

    public static void nhapXuat2() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhap ten");
        String name = scanner.nextLine();
        int day = 0;
        int month = 0;
        day = inputNumber("ngay sinh");
        month = inputNumber("thang");
        if (month == 1) {
            if (day <= 31 && day >= 20) {
                System.out.printf("%s cung Bảo Bình", name);
            } else if (day > 0 && day <= 19) {
                System.out.printf("%s cung Ma Kết", name);
            }
        }
        if (month == 2) {
            if (day <= 28 && day >= 19) {

                System.out.printf("%s cung Song Ngư", name);
            } else if (day > 0 && day < 19) {

                System.out.printf("%s cung Bảo Bình", name);
            }
        }
        if (month == 3) {
            if (day >= 21 && day <= 31) {

                System.out.printf("%s cung Bạch Dương", name);
            } else if (day > 0 && day < 21) {

                System.out.printf("%s cung  Song Ngư", name);
            }
        }
        if (month == 4) {
            if (day >= 20 && day <= 30) {

                System.out.printf("%s cung  Kim Ngưu", name);
            } else if (day > 0 && day < 20) {
                System.out.printf("%s cung Bạch Dương", name);
            }
        }
        if (month == 5) {
            if (day >= 21 && day <= 31) {

                System.out.printf("%s cung  Song Tử", name);
            } else if (day > 0 && day < 21) {
                System.out.printf("%s cung Kim Ngưu", name);
            }
        }
        if (month == 6) {
            if (day >= 21 && day <= 30) {

                System.out.printf("%s cung  Cự Giải", name);
            } else if (day > 0 && day < 21) {
                System.out.printf("%s cung Song Tử", name);
            }
        }
        if (month == 7) {
            if (day >= 23 && day <= 31) {
                System.out.printf("%s cung  Sư Tử", name);
            } else if (day > 0 && day < 23) {
                System.out.printf("%s cung Cự Giải", name);
            }
        }
        if (month == 8) {
            if (day >= 23 && day <= 31) {

                System.out.printf("%s cung  Xử Nữ", name);
            } else if (day > 0 && day < 23) {
                System.out.printf("%s cung  Sư Tử", name);
            }
        }
        if (month == 9) {
            if (day >= 23 && day <= 30) {
                System.out.printf("%s cung  Thiên Bình", name);
            } else if (day > 0 && day < 23) {
                System.out.printf("%s cung  Xử Nữ", name);
            }
        }

        if (month == 10) {
            if (day >= 23 && day <= 31) {

                System.out.printf("%s cung  Bọ Cạp", name);
            } else if (day > 0 && day < 23) {
                System.out.printf("%s cung  Thiên Bình", name);
            }
        }
        if (month == 11) {
            if (day >= 22 && day <= 30) {

                System.out.printf("%s cung Nhân Mã", name);
            } else if (day > 0 && day < 22) {
                System.out.printf("%s cung  Bọ Cạp", name);
            }
        }
        if (month == 12) {
            if (day >= 22 && day <= 31) {
                System.out.printf("%s cung Ma Kết", name);
            } else if (day > 0 && day < 22) {
                System.out.printf("%s cung Nhân Mã", name);
            }
        }
        System.out.println("nhap sai roi");

    }

}