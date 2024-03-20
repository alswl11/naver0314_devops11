package day0320;

public class Ex11_ArrayRank {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*
		 *   등수를 구하는데 동점일경우 동순위를 부여한다  
		 *   출력은 	번호 		점수 		등수 순으로 출력한다 
		 */
		
		int [] score = {100, 90, 80, 90, 70};
		int [] rank = new int[5];
		
		
		for(int i = 0; i<score.length; i++) {
			
			rank[i] = 1;
			
			for(int j =0; j<score.length; j++) {
				// 등수 구하기 
				// 상대방 (j)가 더 크면 기준등수(i)의 값을 1 증가한다 
				if(score[i] < score[j])  {
					rank[i]++;
//					System.out.println(rank[i]);
				}
			}
		}
		
		// 출력 
		System.out.println("번호\t점수\t등수\t");
		System.out.println("=".repeat(22));
		for(int i = 0; i<score.length; i++) {
			System.out.println((i+1) +"\t" + score[i]+ "\t"+ rank[i]);
			
		}
	}

}
