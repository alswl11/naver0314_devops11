package day0318;

import java.util.Scanner;

public class Ex4_SwitchString {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		String color;
		
		System.out.println("영문으로 색상 입력하기");
		color = sc.nextLine();
		// switch에서 문자열도 가능(JDK 8부터) 
	
		switch(color) {
		case "RED": // 아래와 동일한 로직이니까 break없애서 다음 case로 넘어가도록 함!
		case "Red" : 
		case "red":
			System.out.println("빨간색");
			break;
		case "GREEN" : 
		case "Green" :
		case "grren" :
			System.out.println("초록색");
			break;
		case "PINK" :
		case "pink" :
		case "Pink" :
			System.out.println("분홍색");
			break;
		default :
			System.out.println("빨강, 초록, 분홍 이외의 색!");
		}

	}

}
