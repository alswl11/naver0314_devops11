package day0320;

import java.util.Random;
import java.util.Scanner;

public class Ex3_RandomGame {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*
		 *  1. 1-100사이의 난수를 발생한 후 숫자 알아맞추기 
		 *  2. 숫자 입력시 앞에 횟수 출력  
		 *  3. 숫자(n) > 난수 -> (n보다 작습니다)  
		 *  4. 드디어 숫자를 맞췄을 때 (횟수와 정답을 출력 후)
		 *  5. 계속 숫자맞추기 게임을 하시겠습니까?(Y/N) 
		 *  6. y : 다시 난수 발생 후 숫자 맞추기 시작  
		 *  7. y가 아니면 게임 종료  
		 *  
		 */

		Random rd = new Random();
		Scanner sc = new Scanner(System.in);

		int su, count, rnd;

		Exit:
			while(true) {

				// 횟수 초기화  
				count = 0;

				// 난수 구하기 
				//rnd = rd.nextInt(100)+1; // 1~100 사이의 수가 정해짐  
				rnd = rd.nextInt(200)+55;

				while(true) {
					System.out.print(++count + "회 : ");
					su = Integer.parseInt(sc.nextLine());
					if(su>rnd)
						System.out.println("\t" + su + "보다 작습니다");
					else if (su < rnd)
						System.out.println("\t" + su + "보다 큽니다");
					else {
						System.out.printf("** 정답(%d)입니다 **", rnd);
						System.out.print("\n계속하려면 Y, 그만하려면 N을 눌러주세요 : ");
						String ans = sc.nextLine();
						if(ans.equalsIgnoreCase("Y")) {
							System.out.println("** 새로운 게임을 시작합니다 **");
							break;
						}
						else {
							break Exit; // 바깥쪽 while문을 빠져나와서 마지막 게임 종료 문구만 출력  
						}
					}
				}
			}
		System.out.println("** 게임을 종료합니다 **");
	}
}
