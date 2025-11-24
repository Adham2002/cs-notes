public class SavingsAccount extends BankAccount{
    private double interestRate;
    public SavingsAccount(String num, int bal){
        super(num,bal);
        interestRate = 0.05;
    }

    public SavingsAccount(String num, int bal, double rate){
        super(num, bal);
        if(rate<=0.0){throw new IllegalArgumentException("invalid interest rate");}
        interestRate = rate;
    }

    public double getInterestRate(){return interestRate;}

    public void setInterestRate(double rate){
        if(rate<=0.0){throw new IllegalArgumentException("invalid interest rate");}
        interestRate = rate;
    }

    public void applyInterest(){ balance = balance + (int) Math.round(interestRate*getBalance()); }

    @Override
    protected void checkWithdrawal(int amount){
        if (amount <= 0) { throw new IllegalArgumentException("invalid amount"); }
        if (balance-amount < 100) { throw new IllegalArgumentException("insufficient funds for withdrawal"); }
    }
}
