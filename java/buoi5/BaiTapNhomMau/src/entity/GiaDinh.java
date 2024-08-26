package entity;

import java.util.HashMap;
import java.util.List;

public class GiaDinh {
   private HashMap<Role,Nguoi> listThanhVien;

    public GiaDinh() {
         listThanhVien = new HashMap<>();
    }
    public void themThanhVien( Role role,Nguoi nguoi){
        listThanhVien.put(role,nguoi);
    }


    public boolean kiemTraHuyetMach() {
        // cha me con
        // A   A   A,0
        // A    B  A,B,AB,0
        // A    AB  A,B,AB
        // A    O   A,O
        // B    A   A,B,AB,O
        // B    B   B,0
        // B    AB  A,B,AB
        // B    O   B,O
        // AB   A   A,B,AB
        // AB   B   A,B,AB
        // AB   AB  A,B,AB
        // AB   O   A,B
        // O    A   A,O
        // O    B   B,O
        // O    AB  A,B
        // O    O   O
        Boolean res =false;
        List<String> listA = List.of("AA", "AB", "AAB", "AO", "BA", "BAB", "ABA", "ABB", "ABAB", "ABO", "OA", "OAB");


        List<String> listB = List.of("AB", "AAB", "BA", "BB", "BAB", "B0", "ABA", "ABB", "ABAB", "ABO", "OB", "OAB");


        List<String> listAB = List.of("AB", "AAB", "BA", "BAB", "ABA", "ABB", "ABAB");


        List<String> listO = List.of("AA", "AB", "AO", "BA", "BB", "B0", "OA", "OB", "OO");

        String nhomMauCon = listThanhVien.get(Role.con).getNhomMau().toString();
        String nhomMauChaMe = listThanhVien.get(Role.cha).getNhomMau().toString() + listThanhVien.get(Role.me).getNhomMau().toString();
        if (nhomMauCon == "A") {
            if (listA.contains(nhomMauChaMe)) {
                res = true;
            }
        }
        if (nhomMauCon == "B") {
            if (listB.contains(nhomMauChaMe)) {
                res = true;
            }
        }
        if (nhomMauCon == "AB") {
            if (listAB.contains(nhomMauChaMe)) {
                res = true;
            }
        }
        if (nhomMauCon == "O") {
            if (listO.contains(nhomMauChaMe)) {
                res = true;
            }
        }
        return res;
    }

    @Override
    public String toString() {
        return "GiaDinh{" +
                "listThanhVien=" + listThanhVien.toString() +
                '}';
    }
}
