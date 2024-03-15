package day0315;

public class Ex2_DataType {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		// 정수 타입
		byte a = 127;
		System.out.println(a);
		
		byte b = (byte)200; // (byte): cast연산자 : 강제 형변환, 값 손실 발생 
		System.out.println(b); // 값 손실 발생 -> 엉뚱한 값이 출력됨 (내부적으로는 2의 보수값) 
		
		/*
		 * 2의 보수
		 * 
		 * 2^7 + 2^6 + 2^3 = 128+64+8 = 200
		 * 8bit가 = 11001000으로 되는데 200(숫자 넘음) 이니까 다 반대로 적은게 2의 보수임
		 * 11001000 -> 00110111 (읽는 법 :76543210)
		 * 에다가 00000001을 더함 
		 *   00110111
		 * + 00000001
		 * = 00111000 -> 2^3 +2^4 +2^5 = 8+16+32 = -56 (부호bit는 11001000 기준!)
		 *
		 */

		// 실수 타입
		float f1 = 123.567891234f;
		double f2 = 123.567891234;
		
		System.out.println(f1); // 8자리까지 정밀도가 정확하고 이후는 x
		System.out.println(f2); // 16자리까지 정밀도가 정확하고 이후는 x 
		
		// 문자열 타입 
		// 1글자 지정은 char, 문자열은 String(객체타입)
		char ch1 = 'A';
		char ch2 = '가'; // 2바이트라서 한글 한글자도 가능 
		System.out.println(ch1);
		System.out.println(ch2);
		
		// 문자열 지정하는 방법 2가지 
		String str1 = new String("happy");
		String str2 = "hello";
		System.out.println(str1);
		System.out.println(str2);
		
		
		//긴 문자열을 지정하는 경우 
		String str3 = "나는 오늘도 자바공부를 한다.. 오늘은 즐거운 금요일인데 할 일이 없다.. 어쩌고 저쩌고..";		
		String str4 = "나는 오늘도 자바공부를 한다..\n" + "오늘은 즐거운 금요일인데 할 일이 없다..\n" + "어쩌고 저쩌고..";
		System.out.println(str3);
		System.out.println();
		System.out.println(str4);
		
		String str5 = """
				나는 오늘도 자바공부를 한다..
				오늘은 즐거운 금요일인데 할 일이 없다..
				어쩌고 저쩌고..
				""";
		System.out.println();
		System.out.println(str5);

		
		
		
	}

}
