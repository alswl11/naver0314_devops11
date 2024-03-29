package day0322;

class Apple {
	String msg = "Happy Day!!"; // 인스턴스 멤버 변수 
	static String message = "오늘은 금요일";  // static 멤버변수(클래스 멤버변수라고도 부름) 
}

class Banana {
	static int kor = 100;
	static int eng = 80;
	String name = "마이클";
}

public class Ex1_Object {

	// 멤버 변수들 
	String name = "홍길동"; // 인스턴스 변수 
	final static int MAX = 100; // static 변수, final : 상수 지정, 값 변경 안됨  

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/* 
		 *  static 멤버 메서드는 static 멤버 변수나 static 멤버  메서드만 접근 가능함 
		 *  일반 인스턴스 메서드나 변수를 접근하기 위해서는 new로 생성 후 그 변수 활용해서 호출해야 함  
		 */

		// syso(name)하면 오류 발생 
		System.out.println(Ex1_Object.MAX); // static 변수는 클래스명.변수명 
		System.out.println(MAX); //같은 클래스 일 경우는 앞에 클래스명이생략 가능 함 

		// name을 출력하려면 new 생성한 인스턴스 변수가 필요하다 
		Ex1_Object ex = new Ex1_Object();
		// ex가 인스턴스 변수, 이 변수 이용해야먄 name 접근 가능 
		System.out.println(ex.name);


		// Apple이 가진 2개의 멤버변수를 출력하세요 
		// static변수니까 new 생성 없이 
		System.out.println(Apple.message); // 로 출려 가능한데 
		//		System.out.println(ap.message); 얘도 되긴 하지만 

		Apple ap = new Apple();
		System.out.println(ap.msg);
		// static이 아닌 것은 new 생성 꼭 해줘야 함! 

		System.out.println(Banana.kor);
		System.out.println(Banana.eng);
		int sum = Banana.eng + Banana.kor;
		System.out.println(Banana.eng+Banana.kor);
		System.out.println(sum);
		Banana ba = new Banana();
		System.out.println(ba.name);


	}

}
