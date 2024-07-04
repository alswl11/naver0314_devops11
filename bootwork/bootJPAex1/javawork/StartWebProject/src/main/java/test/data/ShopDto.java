package test.data;

public class ShopDto {
    private String sangpum;
    private String photo;
    private int price;
    private int count;
    private String color;

    public ShopDto() {
        super();
    }

    public ShopDto(String sangpum, String photo, int price, int count, String color) {
        super();
        this.sangpum = sangpum;
        this.photo = photo;
        this.price = price;
        this.count = count;
        this.color = color;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getSangpum() {
        return sangpum;
    }

    public void setSangpum(String sangpum) {
        this.sangpum = sangpum;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
