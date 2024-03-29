package day0319;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Ex10_DateNumberFormat {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// 현재 날짜를 문자열로 출력하기 
		
		// public이 아니면 new로 생성할 수 없음! 

		Date date = new Date();

		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss EEE"); // HH : 24시간, EEE : 화 
		System.out.println(sdf1.format(date)); //2024-03-19 16:33:33 화



		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss EEEE"); // a : 오전,오후 hh : 12시간 EEEE : 화요일  
		System.out.println(sdf2.format(date)); // 2024-03-19 오후 04:33:33 화요일
		
		SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초 EEEE"); 
		System.out.println(sdf3.format(date)); // 2024년 03월 19일 16시 35분 22초 화요일
		System.out.println();
		
		// 숫자 포멧 양식 지정하기 
		
		int money = 5678900;
		double average = 98.7656;
		
		NumberFormat nf1 = NumberFormat.getCurrencyInstance(); //currencyInstance쓰면 화폐단위와 3자리마다 컴마가 추가되서 출력된다 
		System.out.println(nf1.format(money));
		
		// 따로 생성없이 바로 메서드 호출해도 됨 
		System.out.println(NumberFormat.getInstance().format(money)); // 얜 그냥 컴마만 붙고 
		System.out.println(NumberFormat.getCurrencyInstance().format(money)); // 얜 화폐단위까지 붙는다 

		// 평균값을 소숫점이하 1자리로 출력하기 
		NumberFormat nf2 = NumberFormat.getInstance();
		nf2.setMaximumFractionDigits(1);
		System.out.println(nf2.format(average));
		
		
		

	}

}
