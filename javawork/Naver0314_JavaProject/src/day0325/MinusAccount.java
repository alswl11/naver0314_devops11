package day0325;

public class MinusAccount extends BankAccount {

	private Long minusLimit;
	
	public MinusAccount(String number, String passworkd, String name, long balance, long minusLimit) {
		super(number, passworkd, name, balance);
		this.minusLimit = minusLimit;
	
		
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void deposit(long inputAccount) {
		// TODO Auto-generated method stub
		super.deposit(inputAccount);
		
	}
	@Override
	public void withdraw(long outputAcount) {
		// TODO Auto-generated method stub
		if(outputAcount < 0) {
			System.out.println("0 이하의 금액은 출금할 수 없습니다");
		}
		else if (balance + minusLimit < outputAcount) {
			System.out.println("한도초과로 출력되지 않습니다");
		}
		else {
			System.out.println("=".repeat(50));
			System.out.println(outputAcount + "원이 출금되었습니다");
			System.out.println("=".repeat(50));
			balance -= outputAcount;
		}
	}
	@Override
	public void printAccount() {
		// TODO Auto-generated method stub
		System.out.println("(마이너스) 계좌번호 : " + number + "\n비밀번호 : " + password + 
				 "\n예금주 : " +name + "\n계좌잔액 : " + balance +"원\n" + "마이너스 한도 : " + minusLimit);	}
	

}
