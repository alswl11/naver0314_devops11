package day0318;

import java.util.Scanner;

public class Ex12_Gugudan {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 *  구구단? 11
		 *  (2~9) 사이가 아니라면 "잘못된 숫자입니다" 출력 : if
		 *  
		 *  구구단? 5
		 *  	
		 *  	** 5단 **
		 *  
		 *  	5x1 = 5 : 단일 for
		 *  	5x2 = 10
		 *  	...
		 *  
		 *  
		 */
		
		Scanner sc = new Scanner(System.in);
		
		int gugudan;
		
		
		System.out.print("구구단? ");
		gugudan = sc.nextInt();
		if (gugudan < 2 || gugudan > 9) {
			System.out.println("잘못된 숫자입니다");
			return;
		} else {
			System.out.printf(" ** %d단 **\n", gugudan);
			for(int i = 1; i<10; i++) {
				
				System.out.printf("%dx%d = %d\n",gugudan, i, gugudan*i );
			}
			
		}
			
	}

}
