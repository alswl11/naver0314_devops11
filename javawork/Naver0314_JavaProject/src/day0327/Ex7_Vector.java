package day0327;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Scanner;
import java.util.Vector;

/*
 *  1. 이름추가	2. 이름삭제	3. 이름출력	4. 이름검색	5. 저장 & 종료  
 *  
 *  종료시 파일에 저장
 *  처음 생성 시 파일에서 읽어올 것 
 *  
 */

public class Ex7_Vector {

	// Scanner를 멤버변수로 선언해서 메서드마다 입력하지 않고 호출하기만 하기 ~

	Scanner sc = new Scanner(System.in);
	List<String> list = new Vector<String>();
	static final String FILENAME = "/Users/parkminji/Documents/naver_0314/person.txt";


	public Ex7_Vector() {
		// TODO Auto-generated constructor stub
		// 파일을 읽어 list에 저장된 이름을 추가하기 
		try {
			personRead();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void personRead() throws IOException {

		FileReader fr = null;
		BufferedReader br = null;

		try {
			fr = new FileReader(FILENAME);
			br = new BufferedReader(fr);

			while(true) {
				String name = br.readLine();
				if(name == null)
					break;
				list.add(name);
			}
			System.out.println("총 " + list.size() + "명의 멤버명을 파일에서 읽어 추가합니다 ");
		} catch (FileNotFoundException e) {
			// TODO: handle exception
			System.out.println("읽어올 명단이 없습니다");
		} finally {
			if(br != null)
				br.close();
			if(fr != null)

				fr.close();
		}
	}

	public void personSave() {
		FileWriter fw = null;
		try {
			fw = new FileWriter(FILENAME);
			for(String s : list) {
				fw.write(s + "\n");
			}
			System.out.println("총 " + list.size() + "명의 명단을 파일에 저장합니다 ");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(fw != null)
				try {
					fw.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
	}

	// 메뉴 선택 시 번호 교환 
	public int getMenu() {
		int menu = 0;
		System.out.println("-".repeat(75));
		System.out.println("1. 이름추가	2. 이름삭제	3. 이름출력	4. 이름검색	5. 저장 & 종료");
		System.out.println("-".repeat(75));
		menu = Integer.parseInt(sc.nextLine());
		return menu;
	}

	// 이름 추가 
	public void addPerson() {
		System.out.print("추가할 이름 입력 : ");
		String name = sc.nextLine();
		list.add(name);
		System.out.println(list.size() + "번째 멤버를 추가했어요!");
	}

	// 이름 삭제 
	public void deletePerson() {
		// 이름 입력시 공백도 문자열로 포함되니 조심할 것 
		System.out.print("삭제할 이름 입력 : ");
		String name = sc.nextLine();
		
		boolean f = list.remove(name);
		if(!f) 
			System.out.println(name + "님은 명단에 없습니다 ");
		else
			System.out.println(name + "님을 명단에서 삭제했습니다");
	}

	// 이름 출력 
	public void listPerson() {
		System.out.println(" ** 멤버 현황 ** ");
		for(int i = 0; i<list.size(); i++) {
			System.out.println(i+1 + " : " + list.get(i));
		}

	}

	// 이름 검색 
	public void searchPerson() {
		// 이름을 입력하면 "강호동님은 2번째에 있습니다" 
		boolean f = false;
		System.out.print("검색할 이름 입력 : ");
		String name = sc.nextLine();
		for (int i = 0; i<list.size(); i++) {
			String listName = list.get(i);
			if(listName.equals(name)) {
				f = true;
				System.out.println(name + "님은 " + (i+1) + "번째에 있습니다 ");
			}
		}
		if(!f) {
			System.out.println(name + "님은 명단에 없습니다 ");
		}



	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Ex7_Vector ex = new Ex7_Vector();
		while(true) {
			int menu = ex.getMenu();
			if(menu == 5) {
				ex.personSave();
				System.out.println(" ** 명잔을 파일에 저장 후 종료합니다 ** ");
				break;
			}
			switch(menu) {
			case 1 :
				ex.addPerson();
				break;
			case 2 :
				ex.deletePerson();
				break;
			case 3 :
				ex.listPerson();
				break;
			case 4 :
				ex.searchPerson();
				break;
			default :
				System.out.println(" ** 번호 입력이 잘못되었어요 ** ");
			}
			System.out.println();
		}

	}

}
