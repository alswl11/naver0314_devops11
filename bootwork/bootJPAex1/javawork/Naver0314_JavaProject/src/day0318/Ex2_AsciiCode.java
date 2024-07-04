package day0318;

public class Ex2_AsciiCode {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// char는 내부적으로 int 타입으로 인식함  
		 
		char a = 'A';
		char b = 65; // 65로 줘도 A랑 같음 // asciicode로 65는 문자 'A'이다
		
		System.out.println(a + "," + b);
		System.out.printf("a = %d, %c \n", (int)a, a); 
		// printf는 변환기호 (??)임, 10진수 int로 바꿔서 (int) 하면 65사 나옴 
		System.out.printf("b = %d, %c", (int)b, b);
		System.out.println(a+3); // output :68, char+int = int 
		System.out.println((char)(a+3)); // output : d, 문자a에 3을 더한 알파벳 d가 나옴 
		
		char c = '7';
		System.out.println(c); // 문자 7이 출력됨 
		System.out.println(c+2); //output : 57, 문자 7과 숫자2가 합쳐진거임, 문자 7 아스키코드 : 55 그리고 숫자 2
		// 숫자 7로 변경하고 계산하고자 할 경우
		int n1 = c-'0'; // 55-48 = 7
		// int n1 = c - 48; // 해도 상관없음  
		System.out.println(n1); //output : 숫자 7이 출력됨 
		System.out.println(n1+2); // output : 7+2 = 9
	}

}
