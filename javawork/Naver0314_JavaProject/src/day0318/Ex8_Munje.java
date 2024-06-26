package day0318;

import java.util.Scanner;

public class Ex8_Munje {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 *  상품명(sang)과 수량(su), 단가(dan) 입력받은 후  
		 *  총금액(total)을 구하고 만약 수량이 5개 이상이면 "10프로 할인입니다."와 함께 할인된 금액(dctotal)을 출력하시오  
		 *  
		 *  (예)
		 *  
		 *  상품명 : 딸기 
		 *  수량 : 6
		 *  단가 : 2000
		 *  
		 *  딸기 6개의 총금액 : 12000
		 *  10%할인입니다.
		 *  10프로 할인된 금액 :  10800
		 */
		
		Scanner sc = new Scanner(System.in);
		
		String sang;
		int su, dan, total, dctotal = 0;
		
		System.out.print("상품명 : ");
		sang = sc.nextLine();
		
		System.out.print("수량 : ");
		su = sc.nextInt();
		
		System.out.print("단가 : ");
		dan = sc.nextInt();
		
		total = su*dan;
	
		System.out.println("** 결과 **");
		System.out.println(sang + " "+su +"개의 총 금액 : " + total);
		if (su>=5) {
			System.out.println("10프로 할인입니다");
			dctotal = (int) (total - total*0.1); // dctotal = total*0.9
		}
		System.out.println("10프로 할인된 금액 : " + dctotal);
	}

}
