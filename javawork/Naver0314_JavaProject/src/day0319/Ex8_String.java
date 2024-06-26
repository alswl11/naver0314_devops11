package day0319;

import java.util.StringTokenizer;

public class Ex8_String {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("** Sting 객체의 Method 공부하기 **");
		String str1 = "Have a Nice Day";
		String str2 = "apple";
		String str3 = "Apple";
		
		System.out.println(str1.charAt(7)); // output : N
		System.out.println(str1.charAt(0)); // output : H
		System.out.println(str1.indexOf('a')); // output : 1
		System.out.println(str1.indexOf('S')); // output : -1 (없을 경우 -1이 나옴) 
		System.out.println(str1.lastIndexOf('a')); // 마지막 'a'의 위치 : 13
		System.out.println(str1.length()); // str1의 총 길이 : 15
		
		
		System.out.println(str2.concat("***")); // str2문자에 *** 추가해서 반환, concat : 추가할 때 사
		System.out.println(str2 +"***"); // 위와 동일 
		
		System.out.println(str1.toLowerCase()); // 모두 소문자로 변환해서 반환 
		System.out.println(str1.toUpperCase()); // 모두 대문자로 변환해서 변환 
		
		// 문자열 비교시 (값으로 비교시 equal 사용) 
		System.out.println("apple".equals(str2)); // true
		System.out.println("apple".equals(str3)); // false, 대소문자 구분함!
		System.out.println(str2.equals(str3)); // false, 대소문자 구분함! 
		System.out.println(str2.equalsIgnoreCase(str3)); // true, 대소문자 구분 안함!
		System.out.println(str2 == str3); // 주소를 비교함, 주소다 다르므로 false(==동등연산자는 기본값비교시에만 사용)
		
		// 문자열 추출 
		System.out.println(str1.substring(7)); // 7번인덱스부터 끝까지 추출함 
		System.out.println(str1.substring(7,10)); // 7부터 9까지 추출 
		
		// 문자열 비교  
		System.out.println(str1.startsWith("Have")); // Have로 시작하면 true, 대소문자 구분함 
		System.out.println(str1.startsWith("Nice")); // false
		
		System.out.println(str1.endsWith("Day")); // Day로 끝나면 true, 대소문자 구분함 
		System.out.println(str1.endsWith("Nice"));
		System.out.println(str1.toLowerCase().endsWith("day"));
		
		// compareTo로 비교 
		System.out.println("apple".compareTo("append")); // output : 'l', 'e' : 7(양수 : 첫 문장이 더 크다) 
		System.out.println("apple".compareTo("banana")); // output : 'a', 'b' : -1
		System.out.println("apple".compareTo("apple")); // output :0 : 완전히 같음 (equals처럼) 
		
		
		// 반복 
		System.out.println(str2.repeat(3));
		System.out.println("*".repeat(10));
		
		// 변경 
		System.out.println(str1.replace('a', '*')); // 일부변경 
		System.out.println(str1.replace("Nice", "Good"));
		
		// 문자열 분리(결과값이 배열타입) 
		String colors = "red, blue, green, yellow, pink";
		System.out.println(colors);
		// ,를 분리하고 싶은 경우 
		String []a1 = colors.split(",");
		System.out.println("분리된 배열의 갯수 : " + a1.length);
		System.out.println(a1[0]+a1[4]); // 0번값과 4번 배열값 출력 
		
		// 분리하는 또다른 방법 (split말고) 
		StringTokenizer st = new StringTokenizer(colors, ",");
		System.out.println("분리할 토큰 수 : " + st.countTokens());
		// 분리된토큰값을 출 
		while(st.hasMoreElements()) { // 더 이상 토큰이 없으면 false가 되며 while문을 빠져나간다  
			System.out.println(st.nextToken()); // 다음 토큰 꺼내서 출력 
		}
		
		String msg = "	 hello		";
		System.out.println(msg.length()); // output ; 9
		System.out.println(msg.trim().length()); // 양쪽 공백제거 후 length 
		
		// valueOf : 어떤 타입의 데이터타입이든지 모두 String으로 변환해준다 
		System.out.println(String.valueOf(3)); // 정수3이 문자열 3으로 반환(출력) 
		System.out.println(3+""); // 얘도 똑같이 문자 3으로 변환 
		 
		
		
	}

}
