package day0325;

public class Shop {
	
	private String sang;
	private int su;
	private int dan;
	
	// constructor
	public Shop() {
		
	}
	public Shop(String sang)
	{
		this("이름미정", 2, 1300);
	}
	public Shop(int su, int dan) {
		this("레몬", su, dan);
	}
	public Shop(String sang, int su ,int dan) {
		this.sang = sang;
		this.su = su;
		this.dan = dan;
	}
	// setter
	public void setSang(String sang) {
		this.sang = sang;
	}
	public void setSu(int su) {
		this.su = su;
	}
	public void setDan(int dan) {
		this.dan = dan;
	}
	public void setSangpum(String sang, int su, int dan) {
		setSang(sang);
		setSu(su);
		setDan(dan);
	}
	
	// getter 
	public String getSang() {
		return sang;
	}
	public int getSu() {
		return su;
	}
	public int getDan() {
		return dan;
	}
	public int getTot() {
		int tot = su*dan;
		return tot;
	}
	
	

}
