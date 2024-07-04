package day0325;

public class Student {
	
	private String name;
	private int java;
	private int spring;

	
	// 생성자 (4개)
	public Student() {
//		super(); // 원래는 부모 클래스의 디폴트 생성자 호출하는 명령어 (생략가능)  
		this("아무개", 10, 10);
	}
	public Student(String name) {
		super();
		this.name = name;
	}
	public Student(int java, int spring) {
		super();
		this.java = java;
		this.spring = spring;
	}
	public Student(String name, int java, int spring) {
		super();
		this.name = name;
		this.java = java;
		this.spring = spring;
	}
	
	
	// setter & getter method
	
	public String getName() {
		return name;
	}
	public int getJava() {
		return java;
	}
	public int getSpring() {
		return spring;
	}
	public int getTotal() {
		int total = java + spring;
		return total;
	}
	public double getAverage() {
		return getTotal()/2.0;
	}
	public String getGrade () {
		
		if(getAverage() >= 90.0) 
			return "장학생";
		else if(getAverage() >= 80.0)
			return "우등생";
		else
			return "재시험";
	}
	
	
	public void setName(String name) {
		this.name = name;
	}
	public void setJava(int java) {
		this.java = java;
	}
	public void setSpring(int spring) {
		this.spring = spring;
	}
	public void setScore(int java, int spring) {
		this.java = java;
		this.spring = spring;
	}
	

}
