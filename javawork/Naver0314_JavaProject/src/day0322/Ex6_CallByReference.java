package day0322;

class Stu {
	String name  = "이영자";
	String blood = "A";
	int age = 12;
}
public class Ex6_CallByReference {
	
	public static void changeStu(Stu s) {
		// 주소를 통해서 main s 변수의 값을 직접 변경함 
		s.blood = "O";
		s.age = 34;
	}
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Stu s = new Stu();
		System.out.println(s.name + ", " + s.blood + ", " + s.age );
		changeStu(s); // call by value라면 그대로 a,12로 나오고 reference로 나오면 변경되서 나옴  -> reference, 주소 전달됨 
		System.out.println("메서드 호출 후 다시 출력 ");
		System.out.println(s.name + ", " + s.blood + ", " + s.age ); 

	}

}
