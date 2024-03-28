package day0328;

import java.util.Arrays;
import java.util.List;
import java.util.Vector;

public class Ex3_LambdaForEach {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// List에 데이터를 넣고 출력하는 방법 1
		List<String> list1 = new Vector<String>();
		list1.add("red");
		list1.add("yellow");
		list1.add("pink");
		list1.add("green");
		
		for(String s : list1)
			System.out.println(s);
		System.out.println("=".repeat(15));

		
		// List에 데이터를 넣고 출력하는 방법 2
		List<String> list2 = Arrays.asList("장미꽃","다알리아","안개꽃","칸나", "프리지아");
		
		list2.forEach(s -> System.out.println(s));
	}

}
