package day0319;

public class Ex2_Munje {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 팩토리얼 문제  
		
		int fac =1;
		
		for(int i = 1; i<=10; i++) {
			if(i == 1) {
				fac = 1;
			}
			else {
				fac *=i;
			}
			System.out.println(i+"! = " + fac);

		}
	}

}
