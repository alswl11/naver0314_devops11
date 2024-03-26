package day0325;

import java.util.Scanner;

public class BankMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		
		BankAccount bank = new BankAccount("100-123", "1234", "홍길동", 10000L);
		
		Scanner sc = new Scanner(System.in);
		
	
		
		
		bank.printAccount();
		System.out.print("입금 금액을 입력해 주세요 : ");
		long inputAccount = sc.nextLong();
		
		
		bank.deposit(inputAccount);
		bank.printAccount();
		
		System.out.print("출금할 금액을 입력해주세요 : ");
		long outputAccount = sc.nextLong();
		bank.withdraw(outputAccount);
		bank.printAccount();
		
		System.out.println("=".repeat(50));
		
		MinusAccount ma = new MinusAccount("123-101","5432", "박문수", 10000L, 1000L);
		
		ma.printAccount();
		ma.deposit(10000L);
		ma.printAccount();
		ma.withdraw(21000L);
		ma.printAccount();
		
	}

}
