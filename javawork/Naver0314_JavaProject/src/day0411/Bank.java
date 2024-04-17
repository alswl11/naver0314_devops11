package day0411;

import de.common.DbConnection;

import java.sql.*;
import java.util.Scanner;

// 계좌 조회는 이름으로
// 계좌 번호는 따로 입력 x
// 이름 중복되지 않게
public class Bank {
    public static void main(String[] args) {
        BankJdbc bj = new BankJdbc();
        String name;
        int balance;

        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.println("=".repeat(50));
            System.out.println(">> 메뉴 선택 <<");
            System.out.println("1. 계좌생성   2. 입금   3. 출금   4.계좌 조회   5. 종료");
            System.out.println("=".repeat(50));
            int menu = Integer.parseInt(sc.nextLine());

            try {

                switch (menu) {
                    case 1: // 계좌 생성
                        System.out.print(">> 이름을 입력하세요 : ");
                        name = sc.nextLine();
                        System.out.print(">> 입금할 금액을 입력하세요 : ");
                        balance = Integer.parseInt(sc.nextLine());
                        bj.creatBankBank(name, balance);
                        break;
                    case 2: // 입금
                        System.out.print(">> 이름을 입력하세요 : ");
                        name = sc.nextLine();
                        System.out.print(">> 입금할 금액을 입력하세요 : ");
                        balance = Integer.parseInt(sc.nextLine());
                        bj.deposite(name, balance);
                        break;
                    case 3:
                        System.out.print(">> 이름을 입력하세요 : ");
                        name = sc.nextLine();
                        System.out.print(">> 출금할 금액을 입력하세요 : ");
                        balance = Integer.parseInt(sc.nextLine());
                        bj.withdraw(name, balance);
                        break;
                    case 4: // 전체 출력
                        System.out.print(">> 이름을 입력하세요 : ");
                        name = sc.nextLine();
                        bj.printBank(name);
                        break;
                    case 5:
                        System.out.println(">> 프로그램 종료");
                        System.exit(0);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }
}
