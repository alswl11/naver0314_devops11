package day0320;

public class Ex5_Array {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 배열 선언하는 여러가지 방법이 있음  
		
		int [] arr1;
		// arr1 배열에 몇개를 넣을지 갯수만큼 할당
		arr1 = new int[5]; // 5개의 메모리 공간 할당됨, 각 배열에는 0의 초기값이 할당된다 (객체인 경우 null로 초기값이 할당) 
		
		System.out.println("arr1의 갯수 : " + arr1.length); 
		System.out.println("\n** arr1의 초기값 **" );
		for(int i = 0; i<arr1.length; i++) {
			System.out.println(i + " : " + arr1[i]);
		}
		
		System.out.println("\n** 배열의 일부 값을 변경 후 출력해보자 **");
		arr1[0] = 5;
		arr1[4] = 30;
		for(int i = 0; i<arr1.length; i++) {
			System.out.println(i + " : " + arr1[i]);
		}
		
		System.out.println("\n** 다른 방법으로도 출력해보자(for문) **");
		for(int a : arr1) { // arr1에 있는 값이 자동으로 꺼내져서 a에 넣어짐, 값만 꺼내고 싶을 때 : 이거 사용하면 됨~
			System.out.println(a);
		}
	}
}
