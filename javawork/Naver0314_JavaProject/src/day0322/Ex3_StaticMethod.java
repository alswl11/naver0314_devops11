package day0322;

class MyShop {
	
	private String sangpum;
	private int su, dan;
	private static String message; // 공유되는 값 
	public static final String SHOP = "24시간 이마트";
	
	
	// setter 
	public void setSangpum(String sangpum) {
		this.sangpum = sangpum;
	}
	public void setSu(int su) {
		this.su = su;
	}
	public void setDan(int dan) {
		this.dan = dan;
	}
	static public void setMessage(String message) {
		// static 멤버변수는 같은 구역에 같은 이름의 변수가 있을 경우, 앞에 클래스명을 생략하지말고 써준다 
		MyShop.message = message;
	}
	
	// 상품명, 수량, 단가를 한번에 변경하고 싶은 경우 
	public void setData(String sangpum, int su, int dan) {
		// 메서드 안에서 같은 멤버 메서드는 this로 호출이 가능함 
		this.setSangpum(sangpum);
		this.setDan(dan);
		this.setSu(su);
	}
	
	// 오버로딩 메서드 (중복함수) : 메서드명은 같으나 인자가 달라야 
	public void setData(String sangpum, int su, int dan, String message) {
		// 메서드 안에서 같은 멤버 메서드는 this로 호출이 가능함 
		this.setSangpum(sangpum);
		this.setDan(dan);
		this.setSu(su);
		// 인스턴스 메서드에서 static 메서드 호출이 가능할까? =  ㅇㅇ 
		// static 메서드에서 인스턴스 메서드 호출이 가능할까? =  ㄴㄴ 
		// static 메서드에서 같은 static 메서드 호출 가능 ? = ㅇㅇ 
		setMessage(message); // 인스턴드 메서드 -> static 메서드 호출! 
	}

	// getter
	public String getSangpum() {
		return sangpum;
	}
	public int getSu() {
		return su;
	}
	public int getDan() {
		return dan;
	}
	public static String getMeessage() {
		return message;
	}
	public void writeData() {
		System.out.println("상품명 : " + sangpum);
		System.out.println("수량 : " + su + ", 단가 : " + dan);
		System.out.println("총 금액 : " + su*dan);
		System.out.println("오늘의 메세지 : " + message);
		System.out.println("=".repeat(20));
	}
	

}
public class Ex3_StaticMethod {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		MyShop ms = new MyShop();
		
		System.out.println("초기값 확인 ");
		ms.setDan(1000);
		ms.setSangpum("오이");
		ms.setSu(3);
		ms.setMessage("맛있음 ");		
		System.out.println("상품 : " + ms.getSangpum());
		System.out.println("단가 : " + ms.getDan());
		System.out.println("수량 : " + ms.getSu());
		System.out.println("메세지 : " + ms.getMeessage());
		System.out.println("=".repeat(30));
		
		ms.setData("토마토", 3, 1200, "맛있엉");
		ms.writeData();
		
		MyShop sang1 = new MyShop();
		MyShop sang2 = new MyShop();
		MyShop sang3 = new MyShop();
		
		System.out.println(" ** 상품 1 **");
		sang1.setSangpum("딸기");
		sang1.setSu(3);
		sang1.setDan(2300);
		MyShop.setMessage("오늘 각종 과일 세일합니다!");
		
		sang1.writeData();
		
		System.out.println(" ** 상품 2 **");
		sang2.setData("수박", 2, 30000);
		sang2.writeData();
		
		System.out.println(" ** 상품 3 **");
		sang3.setData("참외", 5, 2000, "오늘 세일 마감!! ");
		sang3.writeData();
		
		System.out.println(" ** 상품 1 다시 출력 **");
		sang1.writeData(); // 메세지 출력이 바뀐게 확인 가능 ! 
		
		System.out.println(" ** 상품 2 수량만 변경 ** ");
		sang2.setSu(5);
		sang2.writeData();

		

	}

}
