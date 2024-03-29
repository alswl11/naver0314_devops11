package day0319;

public class Ex6_While {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int n = 10;
		// 선조건 : 조건이 맞지 않으면 바로 반복문을 빠져나간다  
		while(n>10) {
			System.out.println("Hello #1");
			
		}
		System.out.println();
		// 후조건 : 일단 로직을 처리한 후 조건을 비교하여 빠져나간다  
		do {
			System.out.println("Hello #2");
		} while (n>10);

		// 1. 
		int a = 1;
		while(a<=10) { //10까지만 출력됨 
			System.out.printf("%3d", a++);
		}
		System.out.println();
		
		// 2. 똑같은 방법이긴 함  
		a = 1; 
		while(true) // break만날 때까지 무조건 실행 
		{	
			System.out.printf("%3d", a++);
			if(a>10)
				break;
		}
		System.out.println();

		
		char ch = 'A';
		while(ch < 'Z') {
			System.out.print(ch++);
		}
	}

}
