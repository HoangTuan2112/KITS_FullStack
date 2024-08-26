package entity;

import java.util.Scanner;

public class Nguoi {
    private NhomMau nhomMau;
    private Rh rH;
    private Role role;

    public Nguoi() {
    }

    public Nguoi(NhomMau nhomMau, Rh rH) {
        this.nhomMau = nhomMau;
        this.rH = rH;
    }

    public Nguoi(NhomMau nhomMau, Rh rH, Role role) {
        this.nhomMau = nhomMau;
        this.rH = rH;
        this.role = role;
    }

    public NhomMau getNhomMau() {
        return nhomMau;
    }

    public void setNhomMau(NhomMau nhomMau) {
        this.nhomMau = nhomMau;
    }

    public Rh getrH() {
        return rH;
    }

    public void setrH(Rh rH) {
        this.rH = rH;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getRh() {
        if (rH == Rh.RhDuong) {
            return "+";
        } else
            return "-";

    }

    public boolean checkMauNhan(Nguoi nguoi) {
        if (this.nhomMau == NhomMau.O) {
            if (nguoi.nhomMau == NhomMau.O) {
                return true;
            } else
                return false;
        } else if (this.nhomMau == NhomMau.A) {
            if (nguoi.nhomMau == NhomMau.O || nguoi.nhomMau == NhomMau.A) {
                return true;
            } else
                return false;
        } else if (this.nhomMau == NhomMau.B) {
            if (nguoi.nhomMau == NhomMau.O || nguoi.nhomMau == NhomMau.B) {
                return true;
            } else
                return false;
        } else if (this.nhomMau == NhomMau.AB) {
            return true;

        }


        return false;
    }

    public boolean checkRhNhan(Nguoi nguoi) {
        if (this.rH == Rh.RhAm) {
            if (nguoi.rH == Rh.RhDuong) {
                return false;
            } else
                return true;
        } else if (this.rH == Rh.RhDuong) {
            return true;

        }
        return false;
    }

    @Override
    public String toString() {
        String rh = getRh();
        if (role == Role.cha) {
            return "Cha{" +
                    "nhomMau=" + nhomMau.toString() + rh +

                    '}';
        } else if (role == Role.me) {
            return "Me{" +
                    "nhomMau=" + nhomMau + rh +

                    '}';
        } else if (role == Role.con)
            return "Con{" +
                    "nhomMau=" + nhomMau + rh +

                    '}';
        else
            return "Nguoi{" +
                    "nhomMau=" + nhomMau + rh +

                    '}';
    }
}
