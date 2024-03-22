package day0322;


/*
 *  생성자(constructor)의 특징 
 *  1. 클래스명과 동일한 메서드명으로 만들어야 한다
 *  2. 리턴 타입이 없다 (void가 아니라 그냥 없음!)
 *  3. 오버로딩이 가능하다 (여러개의 생성 가능)
 *  4. 생성할 때 단 한 번 호출이 된다 
 *  5. 멤버변수의 초기화를 담당한다 
 *  
 */
class Kiwi{
	String name, addr;

	Kiwi() { // 생성자 1
		System.out.println("디폴트 생성자");
		name = "이미자";
		addr = "서울";
	}
	Kiwi (String name) { // 생성자 2
		this.name = name;
		addr = "서울";
	}

	Kiwi(String name, String addr) { // 생성자 3
		this.name = name;
		this.addr = addr;
	}


	public void show() {
		System.out.println(name + "님은 " + addr + "에 살고 있어요 ");

		
	}
}

public class Ex8_Constructor {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Kiwi k1 = new Kiwi();
		k1.show();
		
		Kiwi k2 = new Kiwi("강호동");
		k2.show();
		
		Kiwi k3 = new Kiwi("영숙이", "부산");
		k3.show();


	}

}
