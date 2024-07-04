package study.ex2;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@RequiredArgsConstructor // final이나 nonnull이 붙은 멤버변수만 생성자 주입 
@Setter
 
public class Student {
	
	private String schoolName;
	@NonNull
	MyInfo myInfo;
	
//	public Student(MyInfo info) {
//		myInfo =info;
//	}
//	
//	public void setSchoolName (String schoolName) {
//		this.schoolName = schoolName;
//	}
	public void show() {
		System.out.println(myInfo);
		System.out.println("학교명 : " + schoolName);
	}
	
	
}
