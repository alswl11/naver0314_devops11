package day0321;

public class Ex2_ArraySort {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// 기준 i =  0 ~ n-1
		// 비교 j = i+1 ~ n

		// 두 값을 바꿀 경우 
//		int a = 10, b = 20;
//		int temp; // 임시변수  
//		System.out.println("a = " + a +", b = " +b);
//
//		// 두 값을 바꾸기  
//		temp = a;
//		a =b;
//		b = temp;
//		System.out.println("a = " + a + ", b = " +b);

		int [] arr = {5,8,2,1,10};
		// selection sort 이용해서 정령 
		for (int i = 0; i<arr.length-1; i++) {
			for(int j = i+1; j<arr.length; j++) {
				if(arr[i] > arr[j]) { // 오름차순 :> , 내림차순  < 
					// 서로 값을 바꿔야 함
					int temp = arr[i];
					arr[i] = arr[j];
					arr[j] = temp;
				}
			}
		}
		// 출력 
		for(int a : arr) {
			System.out.print(a +"\t");
		}
	}

}
