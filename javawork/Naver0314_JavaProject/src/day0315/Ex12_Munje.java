package day0315;

import java.util.Scanner;

public class Ex12_Munje {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 *  점수(score)를 입력받아 
		 *  점수가 90점 이상이면 "참 잘했어요!!"
		 *  	 80점 이상이면 "수고했어요!"
		 *  	 70점 이상이면 "조금 더 노력하세요!"
		 *  	그 나머지 점수는 "재시험입니다!"
		 *  메세지를 저장할 문자열 변수명은 msg
		 *  msg에 메세지를 저장해서 출력
		 *  
		 *  
		 */
	
		int score;
		String msg;
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("점수를 입력하세요 : ");
		score = sc.nextInt();
		
		msg = score>=90?"참 잘했어요!!":
			  score>=80?"수고했어요!" :
			  score>70? "조금 더 노력하세요!" :
				  "재시험입니다!";
			  
		System.out.println(msg);
		
		
		
	}

}
