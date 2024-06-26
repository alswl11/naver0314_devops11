package day0326;

class OuterClass {
	int a = 10;;
	static int b = 20;
	
	class InnerClass {
		int c = 30;
		static int d = 40;
		
		public void show() {
			System.out.println("a = " + a);
			System.out.println("b = " + b);
			System.out.println("c = " + c);
			System.out.println("d = " + d);

		}
	}
	
	// 정적 내부 클래스 
	static class InnerClass2 {
		int e = 50;
		static int f = 60;
		public void show() {
//			System.out.println("a = " + a);  static 내부 클래스에서는 외부클래스의 인스턴스변수는 접근 불가 
			System.out.println("b = " + b);
			System.out.println("e = " + e);
			System.out.println("f = " + f);
		}
	}
	
	public void disp() {
		InnerClass in = new InnerClass();
		in.show();
		System.out.println( );
		InnerClass2 in2 = new InnerClass2();
		in2.show();
	}
}
public class Ex9_InnerClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		OuterClass outer = new OuterClass();
		outer.disp();
	}

}
