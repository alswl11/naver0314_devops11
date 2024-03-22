package day0322;

import java.util.Scanner;


// call by reference
public class Ex7_ClassSawonArray {
	
	// 입력받는 메서드 
	public static void inputSawonArray(Sawon [] sa) {
		Scanner sc = new Scanner(System.in);

		for(int i = 0; i<sa.length; i++) {
			System.out.print("사원명은 ? ");
			String name = sc.nextLine();
			System.out.print("기본급은 ? ");
			int gibon = Integer.parseInt(sc.nextLine());
			System.out.print("수당은 ? ");
			int sudang = Integer.parseInt(sc.nextLine());
			
			sa[i] = new Sawon(); // 초기값이 null이므로 new로 생성을 해야 메서드 호출이 가능함 
			sa[i].setData(name, gibon, sudang); // 오류 발생 (new 생성해줘야 함)
			
			System.out.println();
		}
	}
	// 출력하는 메서드 
	public static void outputSawonArray(Sawon [] sa) {
		System.out.println("\t [ 사원 급여 현황 ] \n");
		System.out.println("번호\t사원명\t기본급\t수당\t실수령액");
		System.out.println("=".repeat(40));
		
		for(int i = 0; i<sa.length; i++ ) {
			System.out.println(i+1 + "\t" + sa[i].getName() + "\t" + sa[i].getGibon() + "\t" + sa[i].getSudang()
					+ "\t" + sa[i].getNetPay());
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Sawon [] sawon  = null;
		int inwon; 
		Scanner sc = new Scanner(System.in);
		
		System.out.print("직원 인원수는? : ");
		inwon =Integer.parseInt(sc.nextLine());
		// 인원수 만큼 메모리 할당 (초기화가 아님)
		sawon = new Sawon[inwon]; // 초기값 Null 
		
		inputSawonArray(sawon);
		outputSawonArray(sawon);
		
		

	}

}
