package day0322;

public class Sawon {
	
	private String name;
	private int gibon;
	private int sudang;
	
	// setter 
	public void setName(String name) {
		this.name = name;
	}
	public void setGibon(int gibon) {
		this.gibon = gibon;
	}
	public void setSudang(int sudang) {
		this.sudang = sudang;
	}
	public void setData(String name, int gibon, int sudang) {
		setName(name);
		setSudang(sudang);
		setGibon(gibon);
		
	}
	// 실수령액 반환하는 메소드 
	public int getNetPay() {
		int pay = 0;
		pay = gibon-(gibon*3/100) + sudang;
		return pay;
	}
	
	// getter
	public String getName() {
		return name;
	}
	public int getGibon() {
		return gibon;
	}
	public int getSudang() {
		return sudang;
	}
//	public void writeData() {
//		System.out.println("이름 : " + name);
//		System.out.println("기본급 : " + gibon);
//		System.out.println("수당 : " +sudang);
//	}
	

}
