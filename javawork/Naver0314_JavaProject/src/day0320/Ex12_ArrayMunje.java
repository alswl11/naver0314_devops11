package day0320;

import java.util.Scanner;

public class Ex12_ArrayMunje {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*
		 *  처음에 인원수(inwon)를 입력받아서 해당 인원수만큼의  
		 *  name, kor, eng, tot, rank 변수를 배열 할당하고 
		 *  인원수 만큼 이름, 국어점수, 영어점수를 입력하면 
		 *  총점과 등수를 계산해서출력하는 프로그램을 작성하시오 
		 *  
		 *  예)
		 *  
		 *  --------------------------------------------
		 *  번호		이름		국어		영어		총점		등수 
		 *  1		강호동	90		100		190		1
		 *  2		이영자	100		70		170		3
		 *  3		유재석	90		90		180		2
		 *  
		 * 
		 */

		Scanner sc = new Scanner(System.in);

		int inwon;
		int [] kor, eng, tot, rank;
		String [] name;

		System.out.print("인원수를 입력하세요 : ");
		inwon = Integer.parseInt(sc.nextLine());

		name = new String[inwon];
		kor = new int [inwon];
		eng = new int [inwon];
		tot = new int [inwon];
		rank = new int [inwon];

		// 인원수만큼 데이터 입력하기 
		for(int i = 0; i<inwon; i++) {
			System.out.println(i + "번째 데이터 입력 : ");
			System.out.println("\t이름은? ");
			name[i] = sc.nextLine();
			System.out.println("\t국어점수는? ");
			kor[i] = Integer.parseInt(sc.nextLine());
			System.out.println("\t영어점수는? ");
			eng[i] = Integer.parseInt(sc.nextLine());

			tot[i] = kor[i] + eng[i];
		}
		
		// 등수 구하기 
		for(int i = 0; i<inwon; i++) {
			rank[i] = 1;
			for(int j = 0; j<inwon; j++) {
				if(tot[i]<tot[j]) 
					rank[i] ++;
			}
		}
		
		// 출력  
		System.out.println("=".repeat(55));
		System.out.println("번호\t이름\t국어\t영어\t총점\t등수");
		System.out.println("=".repeat(55));
		for(int i = 0; i<inwon; i++) {
			System.out.println(i+1+ "\t" +name[i] + "\t" +kor[i] + "\t" + eng[i] + "\t" + tot[i] + "\t" + rank[i]);
			
		}
		

		
	}

}
