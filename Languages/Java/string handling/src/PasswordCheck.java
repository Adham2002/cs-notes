import java.util.Scanner;

public class PasswordCheck {

    //checking if the password has at least ten characters
    static boolean LengthCheck(String password){
        return password.length() >= 10;
    }

    //checking if the password has at least two lowercase letters
    static boolean LClettersCheck(String password){
        int LCletters = 0;
        for(int i=0; i<password.length(); i++) {
            if (Character.isLowerCase(password.charAt(i)))
                LCletters++;
        }
        return (LCletters>=2);
    }

    //checking if the password has at least two uppercase letters
    static boolean UClettersCheck(String password){
        int UCletters = 0;
        for(int i=0; i<password.length(); i++) {
            if (Character.isUpperCase(password.charAt(i)))
                UCletters++;
        }
        return (UCletters>=2);
    }

    //checking if the password has at least two digits
    static boolean digitsCheck(String password){
        int digits = 0;
        for(int i=0; i<password.length(); i++) {
            if (Character.isDigit(password.charAt(i)))
                digits++;
        }
        return(digits>=2);
    }

    public static void main(String[] args) {
        System.out.print("enter a password ");
        Scanner sc = new Scanner(System.in);
        String password = sc.nextLine();

        if(!LengthCheck(password)||!LClettersCheck(password)||!UClettersCheck(password)||!digitsCheck(password)) {
            System.out.print("Error: Invalid password");
        }
    }
}
