package day0315;

import java.util.Scanner;

public class Ex5_Scanner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// Scanner 선언 
		Scanner sc = new Scanner(System.in); // 키보드로부터 입력을 받는 instance 변수  
		String msg = "";
		System.out.print("메세지를 입력하세요 : ");
		msg = sc.nextLine(); // 문자열로 한 줄을 통으로 읽는다 
		System.out.println("입력한 문자열은 \""+msg+"\" 입니다."); // " 출력하고 싶으면 \ 사용할 것 
		System.out.println("입력한 문자열은 \'"+msg+"\' 입니다."); // ' 출력하고 싶으면 \ 사용할 것 

		int age; 
		System.out.print("당신의 나이는? :");
		// age = sc.nextInt();
		// System.out.println("내 나이는 "+age+"세 입니다.");
		
		// 정수를 문자열로 읽어서 변환 
		age = Integer.parseInt(sc.nextLine());
		System.out.println("내 나이는 "+age+"세 입니다.");
	}

}
