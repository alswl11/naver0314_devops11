package day0325;

class Member {
	private String memberName;
	private int memberCount;

	Member() {  // default constructor 
		this("동창회", 10);
	}

	Member(String memberName, int memberCount) {
		this.memberName = memberName;
		this.memberCount = memberCount;
	}

	public void writeMember() {
		System.out.println("모임 이름 : " + memberName);
		System.out.println("모임 정원 : " + memberCount);
	}
}

class SubMember extends Member {
	private String myName;
	private int myAge;

	SubMember() {
		super(); // 생략되어 있음! 
		// 부모클래스의 내용인 동창회, 10 의 데이터가 들어가있음 
		myName = "이름없음";
		myAge = 20;
	}

	SubMember(String memberName, int memberCount, String myName, int myAge) {

		super(memberName, memberCount); // 부모 함수 중 인자 2개인 Member생성자가 호출됨  
		this.myName = myName;
		this.myAge = myAge;
	}
	@Override
	public void writeMember() {
		// TODO Auto-generated method stub
		super.writeMember();
		System.out.println("내 이름 : " + myName);
		System.out.println("내 나이 : " + myAge);
		System.out.println("=".repeat(20));
	}
}
public class Ex7_Inheri {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		SubMember sb = new SubMember();
		sb.writeMember();

		SubMember sb2 = new SubMember("701모임", 30, "이영자", 35);
		sb2.writeMember();
	}
}
