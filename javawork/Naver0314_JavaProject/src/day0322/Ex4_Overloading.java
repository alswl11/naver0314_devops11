package day0322;

class Oper {
	
	// 메서드 오버로딩 
	static public int sum(int a, int b) {
		return a+b;
	}
	static public double sum(double a, double b) {
		return a+b;
	}
	static public String sum(String a, String b) {
		return a+b;
	}
	
	// variable argument
	static public int hap(int ...n) { // 갯수 제한 없이 인자로 받을 수 있다. 
		System.out.println("전달받은 숫자의 갯수 : " + n.length);
		int s = 0;
		for(int i = 0; i<n.length; i++) {
			System.out.printf("%4d", n[i]);
			s+=n[i];
		}
		System.out.println();
		return s;
	}
	
	public static void writecolor(String ...color) {
		System.out.println("총 " + color.length+ " 개의 색상 전달받음! ");
		for(int i = 0; i<color.length; i++) {
			System.out.println(i+" : " + color[i]);
		}
		System.out.println("=".repeat(30));
	}
	
}
public class Ex4_Overloading {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	
		System.out.println(Oper.sum(5, 100));
		System.out.println(Oper.sum(1.2, 5.6));
		System.out.println(Oper.sum("apple", "banana"));
	
		System.out.println("총 합계 : " + Oper.hap(3,6,8));
		System.out.println("총 합계 : " + Oper.hap(66,55,88,22,44));
		System.out.println();

		Oper.writecolor("red");
		Oper.writecolor("yellow", "red", "pink" ,"black");
		
	}

}
