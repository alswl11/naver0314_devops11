package day0319;

import java.util.Scanner;

public class Ex11_StringMunje {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*
		 *  문제 
		 *  String타입의 문자열(msg)를 입력받아 
		 *  그 문자열 안에 대문자, 소문자, 숫자가 몇개가 포함되어 있는지 출력하시오 
		 *  
		 *  예)
		 *  Happy Day 123!!!
		 *  대문자 : 2개
		 *  소문자 : 6개 
		 *  숫 자 : 3개 
		 *  
		 *  String의 charAt과 Length 사용하면 됨 
		 */

		Scanner sc = new Scanner(System.in);

		String msg;
		int num=0, bigCount=0, smallCount =0;

		System.out.print("문자를 입력하세요 : ");
		msg = sc.nextLine();

		for(int i = 0; i<msg.length(); i++) {
			if(msg.charAt(i) >= 'A' && msg.charAt(i)<='Z') {
				bigCount ++;
			}
			else if (msg.charAt(i)>='a' && msg.charAt(i)<='z') {
				smallCount++;
			}
			else if (msg.charAt(i)>= '0' && msg.charAt(i)<'9') {
				num++;
			}

		}
		System.out.println("대문자 : " + bigCount + "\n소문자 : " + smallCount + "\n숫자 : " +num);

	}

}
