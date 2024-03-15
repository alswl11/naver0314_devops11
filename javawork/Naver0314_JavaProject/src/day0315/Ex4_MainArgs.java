package day0315;

public class Ex4_MainArgs {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println(args[0]);
		System.out.println(args[1]);
		System.out.println(args[2]+args[3]);
		// 문자열 -> 숫자로 변환 후 계산
		// wrapper class 중 integer를 이용해서 변
		int s1 = Integer.parseInt(args[2]); // "10"이 숫자 10으로 변환 
		int s2 = Integer.parseInt(args[3]); // "20"이 숫자 10으로 변환 
		System.out.println(s1+s2);
		


		
		
	}

}
