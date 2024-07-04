package day0318;

import java.util.Scanner;

public class Ex1_Munje {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 * 
		 * 점수(score)입력 후 score가 90점 이상이면 "A", 80는 "B", 70 "C", 60 "D" 나머지는 "F"를 출력 
		 * (조건연산자를 이용해서 구하기)
		 * 
		 * 
		 * (예)
		 * 점수?
		 * 89
		 * 
		 *  89점은 B학점입니다 
		 */
		
		
		Scanner sc = new Scanner(System.in);
		
		int score;
		String grade;
		
		System.out.println("점수 ?");
		score = sc.nextInt();
		
		// if문을 이용해서 점수를 잘못했을경우, 메서드 종료를 하자 
		
		if(score < 1 || score > 100) {
			System.out.println("잘못된 정보입니다.");
			return; // main method 종료 = program 종
		}
		
		grade = score >= 90 ? "A" :
			score >= 80 ? "B" :
			score >= 70 ? "C" :
			score >= 60 ? "D" :
			"F";
			
		System.out.printf("%d점은 %s학점입니다.", score, grade);
		// System.out.println(score + "점은 " + grade + "학점입니다");
		


	}

}
