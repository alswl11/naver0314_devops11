package day0328;

/*
 *  자바에서의 함수형 프로그램인 람다 표현식은 인터페이스를 사용하는 내부 클래스의 또다른 표현식이다 
 *  단, 인터페이스는 단 하나의 추상 메소드만 가지고 있어야 한다 
 */

@FunctionalInterface // 메서드가 1개인지 아닌지 검증하는 역할, 추가 시 오류 발생 (메서드가 하나여야 함)

interface Orange {
	public void write(); // 추상메서드 	
}

interface DataAdd{
	public void add(int x, int y);
}

public class Ex2_Lambda {
	
	// 우리가 알고 있는 익명 내부 클래스 형태로 orange구현 
	Orange or = new  Orange() {
		
		@Override
		public void write() {
			// TODO Auto-generated method stub
			System.out.println("오렌지 먹고 싶어요 ");
		}
	};
	
	public void lambdaMethod() {
		Orange or2 = () -> System.out.println("람다식 오렌지 먹고 싶어요 ");
		// ()로 쓴거는 매개변수 없어서 
		or2.write();
		
		Orange or3 = () -> {
			System.out.println("안녕하세요 ");
			System.out.println("람다식 공부중 ..");
		};
		or3.write();
		
		// 추상메서드 방식
		Orange or4 = new Orange() {
			
			@Override
			public void write() {
				// TODO Auto-generated method stub
				System.out.println("다양한 방법으로 구현하기 ");
			}
		};
		or4.write();
	}
	
	public void lambdaMethod2() {
		
		DataAdd add1 = (int x, int y) ->  System.out.println("두 수의 합 : " + (x+y));
		
		add1.add(10, 20);
		add1.add(4, 1);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Ex2_Lambda ex = new Ex2_Lambda();
		ex.or.write(); // ex가 가진 or + or이 가진 write() 호출 
		ex.lambdaMethod(); // ex가 가진 lambdamethod 호출 
		
		ex.lambdaMethod2();
		
		
	}

}
