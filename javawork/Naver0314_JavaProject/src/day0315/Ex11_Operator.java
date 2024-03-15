package day0315;

import java.util.Scanner;

public class Ex11_Operator {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 조건(삼항) 연산자 
		// 조건식?참 : 거짓
		
		Scanner sc = new Scanner(System.in);
		
		// 두 수를 입력 후 더 큰 숫자를 출력하시오 
//		int su1, su2, max;
//		System.out.print("두 개의 숫자 입력 : ");
//		su1 = sc.nextInt();
//		su2 = sc.nextInt();
//		
//		max = su1>su2?su1:su2;
//		
//		System.out.println("더 큰 수 : "+max);
		
		// 세개의 수를 입력 후 더 큰 숫자를 출력하시오 
		int su1, su2, su3, max;
		System.out.print("3개의 숫자를 입력하세요 : ");
		su1 = sc.nextInt();
		su2 = sc.nextInt();
		su3 = sc.nextInt();
		
		max = su1>su2 && su1>su3?su1 :
			  su2>su1 && su2>su3?su2 : su3;
			  
		System.out.println("제일 큰 수 : "+max);

	}

}
