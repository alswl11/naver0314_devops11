package day0322;

class Student{
	private String name;
	private int kor, eng, tot;
	private double avg;
	
	Student () {
		this("이름 미정", 20, 20);  // 반드시 첫 줄이어야만 한다, 3번쨰 생성자 호출 
	}
	
	Student (String name) {
		this(name, 50,60);
	}
	
	Student (String name, int kor, int eng) {
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.tot = kor + eng;
		this.avg = tot/2.0;
	}
	
	public void disp() {
		System.out.println("이름 : " + name);
		System.out.println("국어점수 : " + kor);
		System.out.println("영어점수 : " + eng);
		System.out.println("총 점 : "  + tot);
		System.out.println("평 균 : " + avg);
		System.out.println("=".repeat(20));
	}
}
public class Ex9_Contstrutor {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Student st1  = new Student();
		st1.disp();
		
		Student st2 = new Student("한소희");
		st2.disp();
		
		Student st3 = new Student("강호동", 90, 89);
		st3.disp();

	}

}
