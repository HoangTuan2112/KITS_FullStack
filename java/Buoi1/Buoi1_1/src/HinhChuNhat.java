public class HinhChuNhat {
    public float dai;
    public float rong;

    public HinhChuNhat() {
    }

    public HinhChuNhat(float dai, float rong) {
        this.dai = dai;
        this.rong = rong;
    }
    public float chuVi(){
        return (dai+rong)*2;
    }
    public float dienTich(){
        return dai*rong;
    }
}
