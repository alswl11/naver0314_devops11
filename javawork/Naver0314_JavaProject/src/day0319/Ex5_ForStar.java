package day0319;

public class Ex5_ForStar {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		for(int i = 1; i<=5; i++) {
			for(int j = 1; j<=5; j++) {
				System.out.print("☆");
			}
			System.out.println();
		}
		System.out.println("=".repeat(10));

		for(int i = 1; i<=5; i++) {
			for(int j = 1; j<=i ; j++) {
				System.out.print("☆");
			}
			System.out.println();
		}

		System.out.println("=".repeat(10));

		for(int i = 1; i<=5; i++) {
			for(int j = 5; j>=i ; j--) {
				System.out.print("☆");
			}
			System.out.println();
		}

	}

}
