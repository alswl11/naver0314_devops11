package day0318;

import java.util.Scanner;

public class Ex13_ForMunje {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("지수승 구하기");
		System.out.println("3의 3승은 " + (int)Math.pow(3, 3));
		System.out.println("2의 4승은 " + (int)Math.pow(2, 4));
		
		/*
		 *  x, y 두 숫자를 입력 후 x의 y승 값을 구하시오  
		 *  (예)
		 *  x? 3
		 *  y? 4
		 *  3의 4승은 81입니
		 */
		
		Scanner sc = new Scanner(System.in);
		int x, y, sum = 1;
		
		System.out.print("x? ");
		x = sc.nextInt();
		System.out.print("y? ");
		y = sc.nextInt();
		
		for(int i = 1; i<=y; i++) {
			sum = sum * x;
		}
		System.out.printf("%d의 %d승은 %d입니다", x, y, sum);

	}

}
