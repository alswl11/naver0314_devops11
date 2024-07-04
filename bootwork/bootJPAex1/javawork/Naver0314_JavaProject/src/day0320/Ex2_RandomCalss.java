package day0320;

import java.util.Random;

public class Ex2_RandomCalss {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Random rd = new Random();
		
		System.out.println("** Random 클래스를 이용한 난수 구하기 **");
		System.out.println("1. 0~9 난수 구하기 ");
		for(int i = 1; i<=5; i++) {
			int n = rd.nextInt(10);
			System.out.printf("%4d", n);
		}
		System.out.println();
		System.out.println("=".repeat(30));
		
		System.out.println("2. 1~10 난수 구하기 ");
		for(int i = 1; i<=5; i++) {
			int n = rd.nextInt(10)+1;
			System.out.printf("%4d", n);
		}
		System.out.println();
		System.out.println("=".repeat(30));
		
		System.out.println("3. 1~100 난수 구하기 ");
		for(int i = 1; i<=5; i++) {
			int n = rd.nextInt(100)+1;
			System.out.printf("%4d", n);
		}
		System.out.println();
		System.out.println("=".repeat(30));
		
		System.out.println("4. 65(A) ~ 90(Z) 난수 구하기 ");
		for(int i = 1; i<=5; i++) {
			int n = rd.nextInt(26)+65;
			System.out.printf("%4c", (char)n);
		}
		System.out.println();
		System.out.println("=".repeat(30));
		
		System.out.println("5. 97(a) ~ 122(z) 난수 구하기 ");
		for(int i = 1; i<=5; i++) {
			int n = rd.nextInt(26)+97;
			System.out.printf("%4c", (char)n);
		}
		System.out.println();
		System.out.println("=".repeat(30));
		
	}

}
