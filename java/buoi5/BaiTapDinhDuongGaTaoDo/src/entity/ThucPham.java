package entity;

public class ThucPham {
    private float carb;
    private float fat;
    private float fatBaoHoa;
    private float protein;
    private float calo;

    public ThucPham() {
    }
    public ThucPham(float carb, float fat, float fatBaoHoa, float protein, float calo) {
        this.carb = carb;
        this.fat = fat;
        this.fatBaoHoa = fatBaoHoa;
        this.protein = protein;
        this.calo = calo;
    }

    public float getCarb() {
        return carb;
    }

    public void setCarb(float carb) {
        this.carb = carb;
    }

    public float getFat() {
        return fat;
    }

    public void setFat(float fat) {
        this.fat = fat;
    }

    public float getFatBaoHoa() {
        return fatBaoHoa;
    }

    public void setFatBaoHoa(float fatBaoHoa) {
        this.fatBaoHoa = fatBaoHoa;
    }

    public float getProtein() {
        return protein;
    }

    public void setProtein(float protein) {
        this.protein = protein;
    }

    public float getCalo() {
        return calo;
    }

    public void setCalo(float calo) {
        this.calo = calo;
    }

    @Override
    public String toString() {
        return "ThucPham{" +
                "carb=" + carb +
                ", fat=" + fat +
                ", fatBaoHoa=" + fatBaoHoa +
                ", protein=" + protein +
                ", calo=" + calo +
                '}';
    }
}
