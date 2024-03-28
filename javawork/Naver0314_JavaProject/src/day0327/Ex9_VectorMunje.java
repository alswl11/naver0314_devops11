package day0327;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/* 
 *  1. 학생 정보 추가 : 이름, 나이, 자바, 스프링, html 점수 입력 
 *  2. 학생 정보 삭제 : 이름으로 찾아서 삭제 (없을 경우 메세지 출력)
 *  3. 전체 출력 : 번호, 이름, 자바, 스프링, html, 총점, 등급(*)출력 
 *  4. 평균으로 검색 : 평균값을 입력하면 그 평균값 이상의 학생들을 출력
 *  5. 이름으로 검색 : 입력한 이름을 포함하고 있으면 출력 contains
 *  6. 저장 후 종료 : 이름, 나이, 점수를 컴마(,)로 저장 후 프로그램 종료 
 */
public class Ex9_VectorMunje {

	List<StudentDto> list = new ArrayList<StudentDto>();

	Scanner sc = new Scanner(System.in);

	static final String FILENAME = "/Users/parkminji/Documents/naver_0314/student.txt";


	public Ex9_VectorMunje() {
		// TODO Auto-generated constructor stub
		studentReadFile();
	}

	// 파일 읽기 
	public void studentReadFile() {

		FileReader fr = null;
		BufferedReader br = null;

		try {
			fr = new FileReader(FILENAME);
			br = new BufferedReader(fr);

			while(true) {
				String s = br.readLine();
				if(s == null) 
					break;

				// ,로 분리하기 
				String [] a = s.split(",") ;

				// memberDto 생성 후 setter로 데이터 쌓기 
				StudentDto dto = new StudentDto();
				dto.setName(a[0]);
				dto.setAge(Integer.parseInt(a[1]));
				dto.setJava(Integer.parseInt(a[2]));
				dto.setSpring(Integer.parseInt(a[3]));
				dto.setHtml(Integer.parseInt(a[4]));

				// List에 추가 
				list.add(dto);
			}
			System.out.println("총 " + list.size() + "명의 멤버 정보를 읽어왔어요! ");

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("읽어올 멤버 정보가 없습니다 ");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				br.close();
				fr.close();
			} catch (IOException | NullPointerException e) {
				// TODO: handle exception
				// e.printStackTrace();
			}
		}

	}



	// 메뉴 선택 
	public int getMenu() {
		int menu = 0;

		System.out.println("=".repeat(20));
		System.out.println("1. 학생 정보 추가 ");
		System.out.println("2. 학생 정보 삭제");
		System.out.println("3. 전체 출력");
		System.out.println("4. 평균으로 검색");
		System.out.println("5. 이름으로 검색");
		System.out.println("6. 저장 후 종료");
		System.out.println("=".repeat(20));



		try {
			menu = Integer.parseInt(sc.nextLine());	
		} catch (NumberFormatException e) {
			// TODO: handle exception
			System.out.println("번호를 숫자로 입력해주세요");
		}

		return menu;
	}

	// 학생 정보 추가 
	public void addStudent() {
		System.out.print("이름을 입력하세요 : ");
		String name = sc.nextLine();
		System.out.print("나이를 입력하세요 : ");
		int age = Integer.parseInt(sc.nextLine());
		System.out.print("자바 점수를 입력하세요 : ");
		int java = Integer.parseInt(sc.nextLine());
		System.out.print("스프링 점수를 입력하세요 : ");
		int spring = Integer.parseInt(sc.nextLine());
		System.out.print("html 점수를 입력하세요 : ");
		int html = Integer.parseInt(sc.nextLine());

		StudentDto dto = new StudentDto(name, age, java, spring, html);

		// list에 추가 
		list.add(dto);
		System.out.println(list.size() + "번째 학생 정보를 추가했습니다 !");
	}

	// 학생 정보 삭제 
	public void deleteStudent() {
		System.out.print("삭제할 학생 이름을 입력하세요 : ");
		String name = sc.nextLine();
		boolean f = false;

		for(int i = 0; i<list.size(); i++) {
			StudentDto dto = list.get(i);
			if(dto.getName().equals(name)) {
				f = true;
				list.remove(i);
				break;
			}
		}
		if(f) 
			System.out.println(name + "님의 정보를 삭제했습니다 ");
		else
			System.out.println(name + "님은 명단에 없습니다");
	}

	// 전체 출력
	public void writeStudent() {
		System.out.println("\t** 전체 학생 명단 **");
		System.out.println("=".repeat(70));
		System.out.println("번호\t이름\t나이\tJava\tSpring\tHTML\t총점\t평균\t등급");
		
		// 평균 소숫점 한자리로 출력 
		// NumberFormat nf = NumberFormat.getInstance();
		// nf.setMaximumFractionDigits(1);
		
		System.out.println("=".repeat(70));
		for(int i = 0; i<list.size(); i++) {
			StudentDto dto = list.get(i);
			System.out.printf("%d\t%s\t%d\t%d\t%d\t%d\t%d\t%.1f\t%s\n", 
					i+1,
					dto.getName(), 
					dto.getAge(), 
					dto.getJava(), 
					dto.getSpring(), 
					dto.getHtml(), 
//					dto.getTotal(dto.getJava(), dto.getSpring(), dto.getHtml()),
					dto.getTotal(),
//					dto.getAvg(dto.getJava(), dto.getSpring(), dto.getHtml()), 
					dto.getAvg(),
//					dto.getGrade(dto.getJava(), dto.getSpring(), dto.getHtml()));
					dto.getGrade());
			
			// nf.format(dto.getAvg()) + 해도 됨 
		}
		System.out.println("=".repeat(70));
	}



	// 평균으로 검색 
	public void searchAvg() {

		boolean f = false;

		System.out.print("검색할 평균값을 입력하세요 : ");
		double avg = sc.nextDouble();

		for(int i = 0; i<list.size(); i++) {
			StudentDto dto = list.get(i);
			if(dto.getAvg() >=90.0) {
				f = true;
				System.out.println("=".repeat(60));
				System.out.println("이름 : " + dto.getName());
				System.out.println("나이 : " + dto.getAge());
				System.out.println("자바 : " + dto.getJava());
				System.out.println("스프링 : " + dto.getSpring());
				System.out.println("총점 : " + dto.getTotal());
				System.out.println("평균 : " + dto.getAge());
				System.out.println("등급 : " + dto.getGrade());
			}
			if(!f) 
				System.out.println(avg + "이상의 점수를 가진 학생이 없습니다");
		}

	}

	// 이름으로 검색 
	public void searchName() {

		boolean f = false;

		System.out.print("검색할 이름을 읿력하세요 : ");
		String name = sc.nextLine();

		for(int i = 0; i<list.size(); i++) {
			StudentDto dto = list.get(i);
			if(dto.getName().contains(name)) {
				f = true;
				System.out.println("-".repeat(70));
				System.out.println("이름 : " + dto.getName());
				System.out.println("나이 : " + dto.getAge());
				System.out.println("자바 : " + dto.getJava());
				System.out.println("스프링 : " + dto.getSpring());
				System.out.println("총점 : " + dto.getTotal());
				System.out.println("평균 : " + dto.getAvg());
				System.out.println("등급 : " + dto.getGrade());
			}
			if(!f) {
				System.out.println(name + "님은 명단에 없습니다");
			}
		}
	}

	// 저장 후 종료 
	public void studentFileSave() {

		FileWriter fw = null;
		try {
			fw = new FileWriter(FILENAME);
			for(StudentDto dto : list) {
				String s = dto.getName() + "," + dto.getAge() + "," + dto.getJava() + "," + dto.getSpring()
				+ "," + dto.getHtml() + "," + dto.getTotal() + "," + dto.getAvg() + "," + dto.getGrade() + "\n";
				fw.write(s);
			}
			System.out.println("총 " + list.size() + "개의 정보를 파일에 저장함");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				fw.close();
			} catch (IOException | NullPointerException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
			}
		}

	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Ex9_VectorMunje vm = new Ex9_VectorMunje();

		while(true) {

			int menu = vm.getMenu();

			switch(menu) {
			case 1 :
				vm.addStudent();
				break;
			case 2 :
				vm.deleteStudent();
				break;
			case 3 :
				vm.writeStudent();
				break;
			case 4 :
				vm.searchAvg();
				break; 
			case 5 :
				vm.searchName();
				break;
			case 6 :
				vm.studentFileSave();
				System.out.println("** 멤버 정보를 저장 후 종료합니다 ** ");
				System.exit(0); // 종료 
			default :
				System.out.println("잘못된 번호입니다");
			}
			System.out.println();
		}

	}

}
