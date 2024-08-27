import entity.*;


import java.util.*;

public class Main {
    public static void main(String[] args) {
//        //CAU 1
//        Scanner scanner = new Scanner(System.in);
//        System.out.println("Nhap so luong nguoi muon them:");
//        ListNguoiChiaSeMau listNguoiChiaSeMau = new ListNguoiChiaSeMau();
//        int n = scanner.nextInt();
//        listNguoiChiaSeMau.themNhieuNguoi(n);
//        listNguoiChiaSeMau.xuat();
//        //END CAU 1
//
//        //CAU 2
//        Nguoi cha = new Nguoi(NhomMau.AB, Rh.RhDuong, Role.cha);
//        Nguoi me = new Nguoi(NhomMau.O, Rh.RhDuong, Role.me);
//        Nguoi con = new Nguoi(NhomMau.B, Rh.RhAm, Role.con);
//
//        GiaDinh giaDinh = new GiaDinh();
//        giaDinh.themThanhVien(Role.cha, cha);
//        giaDinh.themThanhVien(Role.me, me);
//        giaDinh.themThanhVien(Role.con, con);
//        System.out.println(giaDinh.toString());
//        giaDinh.xuat();
//        if (giaDinh.kiemTraHuyetMach()) {
//
//            System.out.println("DUNG ");
//        } else
//            System.out.println("SAI ");
//        //END CAU 2
//
//        //CAU 3
//
//        System.out.println("Nhap vi tri muon kiem tra nhan duoc tu nhung nguoi con lai:");
//        int index = scanner.nextInt();
//       listNguoiChiaSeMau.cau3(index);
//
//        //END CAU 3


//        scanner.close();
//        String s ="Nguyen : Hoang : Tuan : Tuan : Hoang : Nguyen : Tuan";
//        StringTokenizer stringTokenizer = new StringTokenizer(s," : ");
//        HashMap<String,Integer> hashMap = new HashMap<>();
//        while (stringTokenizer.hasMoreTokens()){
//            String token = stringTokenizer.nextToken();
//            if(hashMap.containsKey(token)){
//                int count = hashMap.get(token);
//                hashMap.put(token,count+1);
//            }
//            else{
//                hashMap.put(token,1);
//            }
//        }
//        for (String key : hashMap.keySet()) {
//            System.out.println(key + " " + hashMap.get(key));
//        }
//        Map<String, Integer> hashMap = new HashMap<>();
//        hashMap.put("Nguyen", 1);
//        hashMap.put("Tu", 4);
//        hashMap.put("Hoang", 2);
//        hashMap.put("Tien", 5);
//        hashMap.put("Tuan", 3);
//        hashMap.entrySet().stream()
//                .forEach(System.out::println);
//
//        System.out.println("====================");
//
//       int sum =hashMap.values().stream()
//                .mapToInt(Integer::intValue)
//                .sum();
//       int sum1 = hashMap.values().stream()
//                .reduce(0,Integer::sum);
//        System.out.println(sum1);
//
//
//
//        System.out.println("====================");
//       Map<String,Integer> newMap = hashMap.entrySet().stream()
//               .reduce(new HashMap<String, Integer>(),(map,entry)->{
//                   if(entry.getValue()>3)
//                        map.put(entry.getKey(),entry.getValue());
//
//                   return map;
//               },(map1,map2)->{
//                   map1.putAll(map2);
//                   return map1;
//               });
//        newMap.entrySet().stream()
//                .forEach(System.out::println);
//
        TreeMap<String, Integer> ageMap = new TreeMap<>();
        ageMap.put("John", 30);
        ageMap.put("Jane", 25);
        ageMap.put("Paul", 35);
        ageMap.put("Anna", 28);
        System.out.println("First Key: " + ageMap.firstKey());
        System.out.println("Last Key: " + ageMap.lastKey());
        System.out.println("SubMap from 'Anna' to 'Paul': " + ageMap.subMap("Anna", "Paul"));
        Nguoi ng1 = new Nguoi(NhomMau.A, Rh.RhDuong);
        Nguoi ng2 = new Nguoi(NhomMau.A, Rh.RhDuong);
        System.out.println(ng2.equals(ng1));

        Box<String> stringBox = new Box<>();
        Box<Integer> integerBox = new Box<>();
        stringBox.setValue("Hello");
        integerBox.setValue(10);
        System.out.println(stringBox.getValue());
        System.out.println(integerBox.getValue());
        Pair<String, Integer> pair = new OrderedPair<>("Hello2", 10);
        System.out.println(pair.getKey());
        System.out.println(pair.getValue());
    }
}