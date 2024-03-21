package day0321;

import java.util.Scanner;

public class Book199_9 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// 학생들 점수 분석하는 프로그램 
		// 학생수, 각 점수를 입력 받고 while문 이용 
		// 최고 점수 및 평균 점수를 출력해라 

		Scanner sc = new Scanner(System.in);

		int stuNum = 0;
		int [] score = new int [3];
		String name;

		Loop :
		while(true) {			
			System.out.println("=".repeat(45));
			System.out.println("1.학생수  2.점수입력  3.점수리스트  4.분석  5.종료");
			System.out.println("=".repeat(45));
			System.out.print("선택 > ");


			int choice = sc.nextInt(); 

			switch(choice ) {
			
			case  1 :
				System.out.print("학생수 > ");
				stuNum = sc.nextInt();
				score = new int[stuNum];			
				break;
			case 2 : 
				for(int i = 0; i<score.length; i++) {
					System.out.printf("scores[%d] > ", i);
					score[i] = sc.nextInt();
				}
				break;
			case 3 : 
				for(int i = 0; i<score.length; i++) {
					System.out.println("scores[" + i +"] > " +score[i]);
				}
				break;
			case 4 :
				int max = 0;
				int sum = 0;
				double avg = 0;

				for(int i = 0; i<score.length; i++) {
					if(max<score[i]) {
						max = score[i];
					}
					else {
						max = max;
					}
					sum += score[i];
				}
				avg = (double) sum / stuNum;

				System.out.println("최고 점수 : " + max + "\n평균 점수 : " + avg);
				break;
			case 5:
				break Loop;
			}
		}
	}
}

