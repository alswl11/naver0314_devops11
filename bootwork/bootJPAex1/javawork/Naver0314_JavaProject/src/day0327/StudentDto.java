package day0327;

public class StudentDto {

	private String name;
	private int age;
	private int java;
	private int spring;
	private int html;

	// 디폴트 생성자 
	public StudentDto() {
		// TODO Auto-generated constructor stub
	}

	// 매개변수 있는 생성자 
	public StudentDto(String name, int age, int java, int spring, int html) {
		super();
		this.name = name;
		this.age = age;
		this.java = java;
		this.spring = spring;
		this.html = html;
	}

	// setter & getter
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getJava() {
		return java;
	}

	public void setJava(int java) {
		this.java = java;
	}

	public int getSpring() {
		return spring;
	}

	public void setSpring(int spring) {
		this.spring = spring;
	}

	public int getHtml() {
		return html;
	}

	public void setHtml(int html) {
		this.html = html;
	}

	// java + spring + html 의 합을 반환하는 메서드 (getTotal)
	public int getTotal() {
		return java+spring+html;
	}
	
	// getTotal/3.0 을 반환하는 메서드 (getAvg)
//	public double getAvg(int java, int spring, int html) {
//		return getTotal(java, spring, html)/3.0;
//	}
	
	public double getAvg() {
		return getTotal()/3.0;
	}
	// getAvg()의 값이 
	//	90 이상 "*****"
	// 	80 "****"
	// 70 "***"
	// 나머지는 "*"
	// 반환하는 메서드 getGrade()
	
	public String getGrade() {
		if(getAvg()>= 90) 
			return "*****";
		else if(getAvg()>= 80)
			return "****";
		else if(getAvg()>= 70)
			return "***";
		else
			return "*";
	}
//	public String getGrade(int java, int spring, int html) {
//		double avg = getAvg(java, spring, html);
//		String grade = null; 
//		switch((int)(avg/10)) {
//		case 10:
//		case 9 :
//			grade = "*****";
//		case 8 :
//			grade = "****";
//		case 7 : 
//			grade = "***";
//		default:
//			grade = "*";
//		}
//		return grade;
//
//	}

}
