package data.dto;

public class ExhiDto {
    private int num;
    private String exhi_name;
    private String exhi_explain;
    private String img_addr;
    private String period;
    private String author;
    private String count;
    private String support;
    private String fee;
    private String location;

    @Override
    public String toString() {
        return "ExhiDto{" +
               "num=" + num +
               ", exhi_name='" + exhi_name + '\'' +
               ", exhi_explain='" + exhi_explain + '\'' +
               ", img_addr='" + img_addr + '\'' +
               ", period='" + period + '\'' +
               ", author='" + author + '\'' +
               ", count='" + count + '\'' +
               ", support='" + support + '\'' +
               ", fee='" + fee + '\'' +
               ", location='" + location + '\'' +
               '}';
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public String getSupport() {
        return support;
    }

    public void setSupport(String support) {
        this.support = support;
    }

    public String getFee() {
        return fee;
    }

    public void setFee(String fee) {
        this.fee = fee;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getExhi_name() {
        return exhi_name;
    }

    public void setExhi_name(String exhi_name) {
        this.exhi_name = exhi_name;
    }

    public String getExhi_explain() {
        return exhi_explain;
    }

    public void setExhi_explain(String exhi_explain) {
        this.exhi_explain = exhi_explain;
    }

    public String getImg_addr() {
        return img_addr;
    }

    public void setImg_addr(String img_addr) {
        this.img_addr = img_addr;
    }
}
