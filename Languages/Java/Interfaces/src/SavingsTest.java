public class SavingsTest {
    public static void main(String[] args) {
        SavingsAccount account = new SavingsAccount("1234567",4000, 0.1);
        account.applyInterest();

        //successful attempt to withdraw money from account
        account.withdraw(2000);
        System.out.println(account.balance);

        //unsuccessful attempt to withdraw money from account
        account.withdraw(2350);
        System.out.println(account.balance);
    }
}
