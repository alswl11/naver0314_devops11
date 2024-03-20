package day0320;

public class Ex7_Array {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int [] data = {23, 100, 24, -4, 41, -60, 1, 307, 60, -52};
		int max, min;
		max = min = data[0]; // 무조건 첫 데이터를 max, min으로 설정 
		System.out.println(data.length);
		
		for(int i = 1; i<data.length; i++) {
			if(max < data[i])
				max = data[i];
			if(min > data[i])
				min = data[i];
		}
		
		System.out.println("최대값 : " + max);
		System.out.println("최소값 : " + min);
		
		
		// 배열 데이터 중 양수의 개수, 음수의 개수를 구해서 출력하세요 

		int pcnt = 0, mcnt = 0;
		
		
		for(int i = 1; i<data.length; i++) {
			if(data[i] > 0)
				pcnt++;
			if(data[i] < 0)
				mcnt++;
		}
		
		System.out.println("양수의 개수 : " + pcnt);
		System.out.println("음수의 개수 : " + mcnt);

	}

}
