package day0315;

public class Ex1_DataType {
	
	// 전역변수는 자동초기화

	public static void main(String[] args) {
		
		// TODO Auto-generated method stub
		// 자바에서의 데이터 타입에 대하 알아보자
		/*
		 *  2024. 03. 15 수업 둘째날
		 *  자바에서의 주석리 하는 방
		 */
		
		// 기존 자료형 공부
		// 지역변수는 자동초기화가 되지 않으므로 초기화 or 변수에 값을 저장해야 출력 가능
		
		// 실수타
		boolean flag  = true;
		boolean flag2 = false;
		
		System.out.println(flag); //println은 오버로딩 메서드 : 이름은 같고 변수,타입 다
		System.out.println(flag2);
		System.out.println(!flag);
		System.out.println(!flag2);
		System.out.println(flag&&flag2); // 모두 true여야 -> true
		System.out.println(flag||flag2); // 하나라도 true -> true
		
	}

}
