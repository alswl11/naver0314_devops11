package day0315;

import java.util.Scanner;

public class Ex7_Scanner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// Ex6의 예제에서 nextInt말고 nextLine으로 변경해서 쓰는 방법
		
		Scanner sc = new Scanner(System.in);
		int kor, eng;
		String name;
		System.out.println("국어점수는?");
		// 아래 
		kor = Integer.parseInt(sc.nextLine());
		System.out.println("영어점수는?");
		// 아래 
		eng = Integer.parseInt(sc.nextLine());
		System.out.println("이름은?");
		name = sc.nextLine();
		
		System.out.println("이름 : " +name);
		System.out.printf("국어점수 : %d점, 영어점수 : %d점\n", kor, eng);
		System.out.printf("총점 : %d점, 평균 : %3.1f점", kor+eng,(double)(kor+eng)/2); // or (kor+eng)/2.0
		

	}

}
