package day0315;

public class Ex3_Output {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int year = 2024;
		int month = 3;
		int day = 5;
		
		String msg = "Have a Nice day!!";
		char blood = 'B';
		double avg = 97.4567;
		
		System.out.println("** 출력 1 **");
		System.out.println("날짜 : " +year+"-"+ month+ "-" +day);
		System.out.print("혈액형 : "+blood+"형"); 
		System.out.println("\t평균 :" +avg); // \t : tap
		// printf 이용 
		// 변환기호를 이용해서 출력
		// 정수 : %d, 실수 : %f, 문자 :%c, 문자열 : %s
		System.out.printf("**%40s**\n\n", msg); //우측으로 40칸 밀려서 출력
		System.out.printf("**%-40s**\n\n", msg);
		System.out.printf("**%s**\n", msg);
		System.out.printf("날짜 : %d-%d-%d\n", year, month, day);
		System.out.printf("날짜 : %2d-%2d-%2d\n", year, month, day); // 2자리로 맞추되 2자리가 안되면 그냥 공백 출력 
		System.out.printf("날짜 : %02d-%02d-%02d\n", year, month, day); // 2자리로 맞취되 2자리가 안되면 0으로 채워서 출력 
		System.out.printf("나의 혈액형은 %c형입니다\n", blood);
		System.out.printf("평균 : *%f\n", avg); // %f :소숫점 이하기 6자리로 출력
		System.out.printf("평균 : *%10.2f점\n", avg); // %3.1 = 전체 자릿수 3자리, 소숫점 이하 자릿수 1자리, 남은 공백 출
		System.out.printf("평균 : *%010.2f점\n", avg); // 남은 자릿수 0으로 처리 
		System.out.printf("평균 : *%-10.2f점\n", avg); // 공백뒤로 '점'자리 출력 
		
	}

}
