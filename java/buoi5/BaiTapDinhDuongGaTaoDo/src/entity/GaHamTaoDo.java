package entity;

import java.util.HashMap;

public class GaHamTaoDo {
    private Ga ga;
    private TaoDo taoDo;
    private HatSen hatSen;
    private CaRot caRot;
    private NamDongCo namDongCo;

    public GaHamTaoDo() {
    }

    public GaHamTaoDo(Ga ga, TaoDo taoDo, HatSen hatSen, CaRot caRot, NamDongCo namDongCo) {
        this.ga = ga;
        this.taoDo = taoDo;
        this.hatSen = hatSen;
        this.caRot = caRot;
        this.namDongCo = namDongCo;
    }

    public Ga getGa() {
        return ga;
    }

    public void setGa(Ga ga) {
        this.ga = ga;
    }

    public TaoDo getTaoDo() {
        return taoDo;
    }

    public void setTaoDo(TaoDo taoDo) {
        this.taoDo = taoDo;
    }

    public HatSen getHatSen() {
        return hatSen;
    }

    public void setHatSen(HatSen hatSen) {
        this.hatSen = hatSen;
    }

    public CaRot getCaRot() {
        return caRot;
    }

    public void setCaRot(CaRot caRot) {
        this.caRot = caRot;
    }

    public NamDongCo getNamDongCo() {
        return namDongCo;
    }

    public void setNamDongCo(NamDongCo namDongCo) {
        this.namDongCo = namDongCo;
    }

    public float tongCarb() {
        return (float) ((ga.getCarb() + taoDo.getCarb() + hatSen.getCarb() + caRot.getCarb() + namDongCo.getCarb()) * 0.8);
    }

    public float tongFat() {
        return (float) ((ga.getFat() + taoDo.getFat() + hatSen.getFat() + caRot.getFat() + namDongCo.getFat()) * 0.8);
    }

    public float tongFatBaoHoa() {
        return (float) ((ga.getFatBaoHoa() + taoDo.getFatBaoHoa() + hatSen.getFatBaoHoa() + caRot.getFatBaoHoa() + namDongCo.getFatBaoHoa()) * 0.8);
    }

    public float tongProtein() {
        return (float) ((ga.getProtein() + taoDo.getProtein() + hatSen.getProtein() + caRot.getProtein() + namDongCo.getProtein()) * 0.8);
    }

    public float tongCalo() {
        return (float) ((ga.getCalo() + taoDo.getCalo() + hatSen.getCalo() + caRot.getCalo() + namDongCo.getCalo()) * 0.8);
    }

        public boolean dayDuChatDinhDuong(float carb1, float fat1, float fatBaoHoa1, float protein1, float calo1) {
        if (
                        tongCarb() >= carb1 &&
                        tongFat() >= fat1 &&
                        tongFatBaoHoa()>= fatBaoHoa1 &&
                        tongProtein() >= protein1 &&
                        tongCalo() >= calo1
        ) {
            return true;
        }
        return false;
    }
    public void boSungChatGi(float carb1, float fat1, float fatBaoHoa1, float protein1, float calo1) {
        boolean carb = true;
        boolean fat = true;
        boolean fatBaoHoa = true;
        boolean protein = true;
        boolean calo = true;

        float thieuCarb = (float) (carb1 - (ga.getCarb() + taoDo.getCarb() + hatSen.getCarb() + caRot.getCarb() + namDongCo.getCarb()) * 0.8);
        float thieuFat = (float) (fat1 - (ga.getFat() + taoDo.getFat() + hatSen.getFat() + caRot.getFat() + namDongCo.getFat()) * 0.8);
        float thieuFatBaoHoa = (float) (fatBaoHoa1 - (ga.getFatBaoHoa() + taoDo.getFatBaoHoa() + hatSen.getFatBaoHoa() + caRot.getFatBaoHoa() + namDongCo.getFatBaoHoa()) * 0.8);
        float thieuProtein = (float) (protein1 - (ga.getProtein() + taoDo.getProtein() + hatSen.getProtein() + caRot.getProtein() + namDongCo.getProtein()) * 0.8);
        float thieuCalo = (float) (calo1 - (ga.getCalo() + taoDo.getCalo() + hatSen.getCalo() + caRot.getCalo() + namDongCo.getCalo()) * 0.8);

        if (tongCarb() < carb1) {
            carb = false;
        }
        if (tongFat() < fat1) {
            fat = false;
        }
        if (tongFatBaoHoa() < fatBaoHoa1) {
            fatBaoHoa = false;
        }
        if (tongProtein() < protein1) {
            protein = false;
        }
        if (tongCalo() < calo1
        ) {
            calo = false;
        }

        HashMap<String, Boolean> map = new HashMap<>();
        map.put("carb", carb);
        map.put("fat", fat);
        map.put("fatBaoHoa", fatBaoHoa);
        map.put("protein", protein);
        map.put("calo", calo);


        if(dayDuChatDinhDuong(carb1,fat1,fatBaoHoa1,protein1,calo1)==false){
            map.forEach((k, v) -> {
                if (v == false) {
                    System.out.println("Can bo sung: " + k);
                    if (k.equals("carb")) {
                        System.out.printf("Bo sung them %f carb\n", thieuCarb);
                    }
                    if (k.equals("fat")) {
                        System.out.printf("Bo sung them %f fat\n", thieuFat);
                    }
                    if (k.equals("fatBaoHoa")) {
                        System.out.printf("Bo sung them %f fatBaoHoa\n", thieuFatBaoHoa);
                    }
                    if (k.equals("protein")) {
                        System.out.printf("Bo sung them %f protein\n", thieuProtein);
                    }
                    if (k.equals("calo")) {
                        System.out.printf("Bo sung them %f calo\n", thieuCalo);
                    }
                }
            });
        }
        else

        System.out.println("Day du chat dinh duong");


    }

    public boolean duCalo() {
        if (tongCalo() > 600) {
            return true;
        }
        return false;
    }

    public float thoiGianDotCalo(boolean a) {
        float thoiGian = 0;
        float soDuCalo = (float) tongCalo() - 600;
        //30 p = 145- 150 calo

        if (a == true) {
            thoiGian = (float) (soDuCalo / 147.5 * 30);
        }


        return thoiGian;
    }

    @Override
    public String toString() {
        return "GaHamTaoDo{" +

                "tongCarb=" + tongCarb() +
                ", tongFat=" + tongFat() +
                ", tongFatBaoHoa=" + tongFatBaoHoa() +
                ", tongProtein=" + tongProtein() +
                ", tongCalo=" + tongCalo() +
                " ga=" + ga +
                ", taoDo=" + taoDo +
                ", hatSen=" + hatSen +
                ", caRot=" + caRot +
                ", namDongCo=" + namDongCo +
                '}';
    }

}
