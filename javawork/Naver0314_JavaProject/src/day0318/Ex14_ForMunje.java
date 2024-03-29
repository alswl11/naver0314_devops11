package day0318;

import java.util.Scanner;

public class Ex14_ForMunje {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 *  5개의 점수(score)를 입력하면 갯수(count)와 함계(sum) 출력하기  
		 *  1~100이 아닐 경우에는 갯수에서 제외하고 합계에서도 제외하기 -continue 사용 
		 *  
		 *  (예)
		 *  점수는? 80
		 *  점수는? 120
		 *  점수는? 70
		 *  점수는? 60
		 *  점수는? 100
		 *  
		 *  입력된 점수 갯수 : 4
		 *  총 합계 : 310
		 */
		
		Scanner sc = new Scanner(System.in);
		int score = 0, count = 0, sum=0;
		
		for(int i = 1; i<=5; i++) {
			
			System.out.print("점수는 ? ");
			score = sc.nextInt();
			
			//continue로 구성할 것 
//			if(score >=1 && score <=100)
//				count++;
//			else
//				continue;
			
			if(score<1 || score >100)
				continue;
			count++; //증감
			sum = sum+score;
			
			
		}
		
		System.out.println("\n입력된 점수 갯수 : " + count);
		System.out.printf("입력된 점수 갯수 : %d", count);
		System.out.println("총 합계 : " + sum);

	}

}
