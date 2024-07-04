package prac;

public class MemberDto2 {

    private String name;
    private String hp;
    private String addr;
    private String blood;
    private String mbti;

    public MemberDto2() {
        super();
    }

    public MemberDto2(String name, String hp, String addr, String blood, String mbti) {
        this.name = name;
        this.hp = hp;
        this.addr = addr;
        this.blood = blood;
        this.mbti = mbti;
    }

    public void setName(String name) {
        this.name = name;
    }
    public void setHp(String hp) {
        this.hp = hp;
    }
    public void setAddr(String addr) {
        this.addr = addr;
    }
    public void setBlood(String blood) {
        this.blood = blood;
    }
    public void setMbti(String mbti) {
        this.mbti = mbti;
    }

    public String getName() {
        return  name;
    }
    public String getHp() {
        return  hp;
    }
    public String getAddr() {
        return  addr;
    }
    public String getBlood() {
        return  blood;
    }
    public String getMbti() {
        return mbti;
    }
}
