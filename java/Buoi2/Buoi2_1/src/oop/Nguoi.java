package oop;

public interface Nguoi {
    boolean totNghiep12();
    default boolean hatHay(){
        return false;
    }
}
