package day0320;

public class Ex1_MathRandom {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// static : 생성하지않고 바로 불러올 수 있음  
		// 대문자 : 65-90

		System.out.println("** Math.random()을 이용한 난수 구하기 **");
		System.out.println("1. random() 시 값 ");
		for(int i = 1; i<=5; i++) {
			double d = Math.random(); // 0.0 <= d < 1.0은 난수 발생, 0은 발생하지만 1은 발생되지 않음 
			System.out.println(d); 
		}
		System.out.println("2. 0~9 발생");
		for(int i = 1; i<=5; i++) {
			int n = (int)(Math.random()*10); // 한 자릿수만 나오도록 소수에 *10해주고 나머지 소숫점은 int 형변환으로 다 날려버림 
			System.out.printf("%4d", n);
		}
		System.out.println();
		System.out.println("=".repeat(30));

		System.out.println("3. 1~9 발생");
		for(int i = 1; i<=5; i++) {
			int n = (int)(Math.random()*10)+1; // 10까지도 출력됨 
			System.out.printf("%4d", n);
		}
		System.out.println();
		System.out.println("=".repeat(30));
		
		System.out.println("4. 1~100 발생");
		for(int i = 1; i<=5; i++) {
			int n = (int)(Math.random()*10)+91; // 100까지도 출력  or (random*100) +1 해도 됨  
			System.out.printf("%4d", n);
		}
		System.out.println();
		System.out.println("=".repeat(30));
		
		System.out.println("5. 65(A) ~ 90(Z) 발생");
		for(int i = 1; i<=5; i++) {
			int n = (int)(Math.random()*26)+65 // 65 : 초기값 자리(A) , 26 : 90-65+1 한 값   
					; // 100까지도 출
			System.out.printf("%4c", (char)n);
		}
		System.out.println();
		System.out.println("=".repeat(30));
		
		System.out.println("6. 97(a) ~ 122(z) 발생");
		for(int i = 1; i<=5; i++) {
			int n = (int)(Math.random()*26)+97; // 97 : 초기값 자리(a), 26 : 122-97+1 한 값  
			System.out.printf("%4c", (char)n);
		}
		System.out.println();
		System.out.println("=".repeat(30));


	}

}
