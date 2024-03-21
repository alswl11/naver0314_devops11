package day0321;

import java.util.Scanner;

public class Ex4_ArrayAlphaCount {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*
		 *  영어 문장을 입력하면 알파벳 기준으로 각각의 개수를 출력하시오 
		 *  Have a Nice Day !!
		 *  
		 * a: 3 	b : 0... 	z :0
		 */
		
		Scanner sc = new Scanner(System.in);
		String msg;
		int [] alpha = new int [26];
		
		System.out.print("영어 문장을 입력하세요 : ");
		msg = sc.nextLine();
	
		for(int i = 0; i<msg.length(); i++) {
			char ch = msg.toUpperCase().charAt(i);  // 대문자로 변경해서 i번쨰 문자 찾기 
			if(ch >= 'A' && ch <= 'Z')
				alpha[ch - 'A'] ++;
		}
		System.out.println("\n알파벳별 갯수 구하기 \n");
		for(int i = 0; i<alpha.length; i++) {
			System.out.printf("%c : %d\t", (char)('A' +i), alpha[i]); // char +int = iint
			if((i+1)%5 == 0) 
				System.out.println();
		}

		
	}

}
