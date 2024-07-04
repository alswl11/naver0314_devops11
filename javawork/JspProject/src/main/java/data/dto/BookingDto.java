package data.dto;

public class BookingDto {
    private String exhi_name;
    private String cnt;
    private String total;


    @Override
    public String toString() {
        return "BookingDto{" +
               "exhi_name='" + exhi_name + '\'' +
               ", cnt='" + cnt + '\'' +
               ", total='" + total + '\'' +
               '}';
    }

    public String getExhi_name() {
        return exhi_name;
    }

    public void setExhi_name(String exhi_name) {
        this.exhi_name = exhi_name;
    }

    public String getCnt() {
        return cnt;
    }

    public void setCnt(String cnt) {
        this.cnt = cnt;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
}

