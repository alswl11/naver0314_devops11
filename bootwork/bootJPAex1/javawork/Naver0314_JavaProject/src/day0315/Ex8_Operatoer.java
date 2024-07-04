package day0315;

import java.util.Scanner;

public class Ex8_Operatoer {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 두개의 숫자를 입력 받은 후 산술연산하기 (+,-,*,/.%)
		
		Scanner sc = new Scanner(System.in);
		System.out.print("두 개의 숫자를 입력하세요 : ");
		int su1 = sc.nextInt();
		int su2 = sc.nextInt();
		
		System.out.println("더하기 : " +(su1+su2));
		System.out.println("빼기 : " +(su1-su2));
		System.out.println("곱하기 : " +(su1*su2));
		System.out.println("나누기 : " + ((double)su1/su2));
		System.out.println("나머지 : " +(double)(su1%su2));




		

	}

}
