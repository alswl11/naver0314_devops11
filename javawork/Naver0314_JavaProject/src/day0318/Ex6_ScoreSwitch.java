package day0318;

import java.util.Scanner;

public class Ex6_ScoreSwitch {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// Ex1_Munje 다시풀어보기  
		
		Scanner sc = new Scanner(System.in);
		
		int score;
		char grade;
		
		System.out.println("점수 ?");
		score = sc.nextInt();
		
		// if문을 이용해서 점수를 잘못했을경우, 메서드 종료를 하자 
		
		if(score < 1 || score > 100) {
			System.out.println("잘못된 정보입니다.");
			return; // main method 종료 = program 종
		}
		
		// 1. switch문으로 해보기 
//		switch(score/10) 
//		{
//		case 10 : case 9 :
//			grade  = 'A';
//			break;
//		case 8 :
//			grade = 'B';
//			break;
//		case 7 :
//			grade = 'C';
//			break;
//		case 6 : 
//			grade = 'D';
//			break;
//		default :
//			grade = 'F';
//		}
//		System.out.println(score + "점은 " + grade + "학점입니다");
		
		// 2. if문으로 해보기 
		if(score >= 90) grade = 'A';
		else if (score >=80) grade = 'B';
		else if (score >=70) grade = 'c';
		else if (score >=60) grade = 'D';
		else grade = 'F';

		System.out.println(score + "점은 " + grade + "학점입니다");

	}

}
