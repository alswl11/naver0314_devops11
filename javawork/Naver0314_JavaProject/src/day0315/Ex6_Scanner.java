package day0315;

import java.util.Scanner;

public class Ex6_Scanner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		int kor, eng;
		String name;
		System.out.println("국어점수는?");
		kor = sc.nextInt();
		System.out.println("영어점수는?");
		eng = sc.nextInt();
//		System.out.println("이름은?");
//		name = sc.nextLine();
//		정수 다음 문자 ->오류 발생함 why? 점수 뒤의 엔터를 읽어서 버퍼에 넣음, 엔터가 퍼에 저장되어 있는 상태 
//		버퍼의 엔터를 읽어서 소멸시키면 됨	
		sc.nextLine();
		System.out.println("이름은?");
		name = sc.nextLine();
		
		
		// 웬만해선 nextInt보다 nextLine()으로 쓰는게 좋음! -> Ex7 class

		
		System.out.println("이름 :" +name);
		System.out.printf("국어점수 : %d점, 영어점수 : %d점\n", kor, eng);
		System.out.printf("총점 : %d점, 평균 : %d점", kor+eng, (kor+eng)/2);
		
	}

}
