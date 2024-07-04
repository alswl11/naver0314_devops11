package prac;

import day0327.MemberDto;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class File2 {

    List<MemberDto2> list = new ArrayList<>();

    static final String FILENAME = "/Users/parkminji/Documents/naver_0314/member1.txt";

    Scanner sc = new Scanner(System.in);

    public File2() {
        memberReadFile();
    }


    // 메뉴 선택
    public int getMenu() {
        int menu = 0;
        System.out.println("=".repeat(20));
        System.out.println("1. 멤버 정보 추가");
        System.out.println("2. 멤버 정보 삭제");
        System.out.println("3. 전체 멤버 출력");
        System.out.println("4. 이름으로 멤버 검색");
        System.out.println("5. 저장 후 종료");
        System.out.println("=".repeat(20));

        try {
            menu = Integer.parseInt(sc.nextLine());
        } catch (NumberFormatException e) {
            System.out.println(" >> 번호를 숫자로 입력해주세요 << ");
        }
        return menu;

    }

    // 파일 읽기
    public void memberReadFile() {

        FileReader fr = null;
        BufferedReader br = null;

        try {
            fr = new FileReader(FILENAME);
            br = new BufferedReader(fr);

            while (true) {
                String s = br.readLine();
                if (s == null)
                    break;

                // , 으로 분비
                String[] a = s.split(",");

                // memberDTO2 생성 후 setter로 데이터 쌓기
                MemberDto2 dt2 = new MemberDto2();
                dt2.setName(a[0]);
                dt2.setHp(a[1]);
                dt2.setAddr(a[2]);
                dt2.setBlood(a[3]);
                dt2.setMbti(a[4]);

                list.add(dt2);
            }
            System.out.println(">> 총 " + list.size() + "명의 정보 있음 <<");

        } catch (FileNotFoundException e) {
            System.out.println(">> 멤버 정보가 없음 << ");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                br.close();
                fr.close();
            } catch (IOException | NullPointerException e) {
                e.printStackTrace();
            }
        }

    }


    // 1. 멤버 데이터 추가
    public void addMember() {
        System.out.print(">> 이름 입력 : ");
        String name = sc.nextLine();
        System.out.print(">> 번호 입력 : ");
        String hp = sc.nextLine();
        System.out.print(">> 주소 입력 : ");
        String addr = sc.nextLine();
        System.out.print(">> 혈액형 입력 : ");
        String blood = sc.nextLine();
        System.out.print(">> MBTI 입력 : ");
        String mbti = sc.nextLine();

        MemberDto2 dto2 = new MemberDto2(name, hp, addr, blood, mbti);

        list.add(dto2);
        System.out.println(" >> 멤버 정보 추가됨 << ");
    }

    // 2. 멤버 데이터 삭제
    public void deleteMember() {
        boolean f = false;
        System.out.print(">> 석제할 이름 입력 : ");
        String name = sc.nextLine();
        for (int i = 0; i < list.size(); i++) {
            MemberDto2 dto2 = list.get(i);
            if (dto2.getName().equals(name)) {
                f = true;
                list.remove(i);
                break;
            }
        }
        if (f)  // f == false
            System.out.println(">> " + name + "님의 정보 삭제함");
        else
            System.out.println(">> " + name + "님이 명단에 없음");

    }

    // 3. 전체 멤버 출력
    public void showMember() {
        System.out.println(" >> 전체 명단 << ");
        System.out.println("=".repeat(70));
        System.out.println("번호 \t 이름\t 번호 \t \t \t 주소 \t 혈액형 \t MBTI");
        System.out.println("=".repeat(70));
        for (int i = 0; i < list.size(); i++) {
            MemberDto2 dto2 = list.get(i);
            System.out.println(i + 1 + " \t\t " + dto2.getName() + " \t " + dto2.getHp() + " \t " + dto2.getAddr() + " \t " + dto2.getBlood() + "형 \t " + dto2.getMbti());
        }
        System.out.println("=".repeat(70));
    }

    // 4. 멤버 검색  - 이름으로 검색
    public void searchMember() {

        boolean f = false;

        System.out.print(">> 검색할 이름 입력 : ");
        String name = sc.nextLine();

        for (int i = 0; i < list.size(); i++) {
            MemberDto2 dt2 = list.get(i);
            if (dt2.getName().startsWith(name)) {
                f = true;
                System.out.println("=".repeat(40));
                System.out.println("이름 : " + dt2.getName());
                System.out.println("번호 :" + dt2.getHp());
                System.out.println("주소 :" + dt2.getAddr());
                System.out.println("혈액형 :" + dt2.getBlood());
                System.out.println("MBTI : " + dt2.getMbti());
            }
//            if (!f) {
//                System.out.println(" >> " + name + "님은 명단에 없습니다 ");
//            }
        }
        if (!f) {
            System.out.println(" >> " + name + "님은 명단에 없습니다 ");
        }

    }

    // 5. 종료시 파일 저장
    public void memberFileSave() {

        FileWriter fw = null;
        try {
            fw = new FileWriter(FILENAME);
            for(MemberDto2 dto2 : list) {
                String s = dto2.getName() + "," + dto2.getHp() + "," + dto2.getAddr() + "," + dto2.getBlood() + "," + dto2.getMbti() + "\n";
                fw.write(s);
            }
            System.out.println(">> 총 " + list.size() + "개의 정보를 파일에 저장했음");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fw.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }


    public static void main(String[] args) {
        File2 f2 = new File2();

        while (true) {

            int menu = f2.getMenu();

            switch (menu) {
                case 1:
                    f2.addMember();
                    break;
                case 2:
                    f2.deleteMember();
                    break;
                case 3:
                    f2.showMember();
                    break;
                case 4:
                    f2.searchMember();
                    break;
                case 5:
                    f2.memberFileSave();
                    System.out.println(" >> 내용 저장 후 프로그램 종료");
                    System.exit(0);
                default:
                    System.out.println(" >> 잘못된 번호입니다 << ");
            }
            System.out.println();
        }
    }
}
