package day0318;

public class Ex9_For {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		for(int i = 1; i<=10; i++) // 증감연산자 
			System.out.printf("%4d", i); // 4칸 단위로 출력 
		System.out.println();
		
		for(int i = 10; i>=1; i--) // 증감연산자 
			System.out.printf("%4d", i); // 4칸 단위로 출력 
		System.out.println();
		
		for(int i = 1; i<=10; i+=3) // 대입연산자  
			System.out.printf("%4d", i); // 4칸 단위로 출력 
		System.out.println();
		
//		for(int i = 'A'; i<='Z'; i++) 
//			System.out.printf("%2c", (char)i);  
//		System.out.println();
		
		for(int i = 65; i<=90; i++)  // 위에와 동일 결과 
			System.out.printf("%2c", (char)i); // 4칸 단위로 출력 
		System.out.println();
		
		for(int i = 'a'; i<='z'; i++)  // 소문
			System.out.printf("%2c", (char)i); // 4칸 단위로 출력 
		System.out.println();
		
		for(int i=1; i<=10; i++) {
			System.out.printf("%3d", i);
			if(i==5)
				break;
		}
		
		System.out.println();
		
		for(int i=1; i<=10; i++) {
			if(i%2==0)
				continue;
			System.out.printf("%3d", i);
		}

	}

}
