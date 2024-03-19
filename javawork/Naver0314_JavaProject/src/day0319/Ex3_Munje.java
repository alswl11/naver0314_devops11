package day0319;

public class Ex3_Munje {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 *  xy + yx = 121 나오도록 하는 한 자릿수 x,y 구하기  
		 *  29+92 = 121
		 */
		
		
		for(int x=1; x<10; x++) {
			for (int y = 1; y<10; y++) {
				int susik = (10*x+y) +(10*y + x);
				if (susik == 121)
					System.out.printf("%d%d + %d%d = 121\n", x, y, y, x);
				}
			}
		}

	}

