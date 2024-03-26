package day0326;

// 인터페이스는 음식점의 메뉴판과 같다 
// 구현 가능한 목록을 나열만 하고 실제 body가 없기 떄문 
// 상수와 추상 메서드로만 구성이 되어있다 


interface InterA {
	int MAX = 20; // 상수이지만 구분할 필요가 없으므로 final 생략 
	public void disp(); // 추상메서드지만 구분할 필요가 없으므로 abstract 생략함 
	public void study();
}

class MyInter implements InterA {
	@Override
	public void disp() {
		// TODO Auto-generated method stub
		System.out.println("현재 최대 인원수는 " +MAX +"명 입니다 ");
	}
	@Override
	public void study() {
		// TODO Auto-generated method stub
		System.out.println("우리는 인터페이스를 공부하고 있어요! ");
	}
	
	public void play() {
		System.out.println("게임을 합시다");
	}
}

public class Ex4_Interface {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		InterA a = new MyInter();
		a.disp();
		a.study();
//		a.play(); 는 호출 안됨 
//		play()를 호출하고자 할 경우 
//		서브 클래스로 형변환 후 호출 
		((MyInter)a).play();
	}

}
