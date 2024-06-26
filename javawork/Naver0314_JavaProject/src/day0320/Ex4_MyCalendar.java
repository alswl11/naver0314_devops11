package day0320;

import java.util.Date;
import java.util.Scanner;

public class Ex4_MyCalendar {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 *  년도와 월을 입력하면 해당 달력을 출력하시오  
		 *  
		 *  만년달력을 만들기 위해서 알아야 할 사향 2가지
		 *  - 내가 입력한 년/월의 1일의 요일이 무엇인가
		 *  - 내가 입력한 년/월이 몇일까지 있는가 
		 */
		
		// Date 사용할 때 
		// year-1900, month+1, date 해줘야 함!
		
		Scanner sc = new Scanner(System.in);
		
		int year, month, week, endday;
		
		System.out.print("달력을 조회할 년도와 월을 입력하세요 : ");
		year = sc.nextInt();
		month = sc.nextInt();
		// 1~12월이 아닐 경우 종료 
		
		if(month<1 || month >12) {
			System.out.println("잘못된 숫자(월)입니다");
			return;
		}
		System.out.println();
		System.out.printf("%10d년 %d월 달력\n\n", year, month);
		System.out.println("=".repeat(50));
		System.out.println("일\t월\t화\t수\t목\t금\t토");
		System.out.println("=".repeat(50));
		
		
		// 1. 내가 입력한 년/월의 1일의 요일이 무엇인가
		Date date = new Date(year-1900, month-1, 1); // 입력한 달의 1일의 요일을 구하기 위해서  
		week = date.getDay(); // 0:일,... 6:토요일
		// System.out.println(week); // 시작인 날을 숫자로 알려줌, 6이면 해당 1일이 토요일  
		
		
		// 2. 내가 입력한 년/월이 몇일까지 있는가 (윤년계산까지 포함임)  
		switch(month) {
		case 2 :
			endday = year%4 == 0 && year%100 != 0|| year%400 == 0? 29 : 28;
		case 4 : case 6 : case 9 : case 11 :
			endday = 30;
			break;
		default :
			endday = 31;
		}
		
		// week(요일수) 만큼 tap으로 띄우기  
		for(int i = 1; i<=week; i++) {
			System.out.print("\t");
		}
		
		// 1일부터 endday까지 출력  
		// 조건 : 토요일은 출력 후 \n해서 라인 넘겨줘야 함  
		for(int i = 1; i <= endday; i++) {
			System.out.printf("%2d\t", i);
			++week; // 토요일이 되면 7의 배수가 된다  
			if(week%7 == 0)
				System.out.println("\n");
		}
		System.out.println();

		

	}

}
