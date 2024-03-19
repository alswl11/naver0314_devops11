package day0319;

import java.util.Calendar;
import java.util.Date;

public class Ex9_DateCalendar {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
 
		// Date 클래스를 이용해서 년,월,일,시분,초 얻기 (JDK1.1 이후 Deprecate 되고 calendar를 권장하나 많이 사용 중)
		
		Date date = new Date(); // 디폴트 생성시 현재 날짜와 시간을 얻는다 
		int year = date.getYear()+1900; // 년도는 1900이 빠진값으로 변환되끼 때문에 1900더해줌 
		int month = date.getMonth()+1; // 월도는 0~11이 반환되기 때문에 1을 더해준다  
		int day = date.getDate(); // 일 
		int week = date.getDay(); // 요일, 숫자로 반환됨 (0:일욜~6:토욜)
		int hour = date.getHours();
		int min = date.getMinutes();
		int sec = date.getSeconds();
		
		
		System.out.println("Date를 이용해서 출력하기 ");
		System.out.println("현재년도 : " +year);
		System.out.println("현재월 : " + month);
		System.out.println("현재일 : " + day);
		System.out.println("현재요일 : " +week + " (" + 
		(week==0 ?"일" : week == 1? "월" : week == 2? "화" : week == 3 ? "수" : week == 4? "목" : week == 5? "금" : "토")  + ")" );
		System.out.printf("%d시 %d분 %d초\n", hour, min, sec);
		System.out.println("=".repeat(30));
		
		
		
		System.out.println("Calendar를 이용해서 출력하기 ");
		Calendar cal = Calendar.getInstance();
		year = cal.get(Calendar.YEAR); // 2024를 반환하지만 
		month = cal.get(Calendar.MONTH)+1;  // 0~11을 반환하기 때문에 +1을 해줘야 한다 
		day = cal.get(Calendar.DATE);
		
		System.out.printf("%d년 %d월 %d일 입니다\n", year, month, day);
		
		
		
		
	}

}
