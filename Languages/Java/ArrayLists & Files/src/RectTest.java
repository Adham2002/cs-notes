import java.util.InputMismatchException;
import java.util.Scanner;

public class RectTest {
    public static void main(String[] args) {
        System.out.print("Enter rectangle width: ");
        Scanner sc = new Scanner(System.in);
        String strw = sc.nextLine();
        try {double w = Double.parseDouble(strw);}catch (NumberFormatException e){
            System.err.println("Error: numbers required for width and height!");
            System.exit(1);
        }

        System.out.print("Enter rectangle height: ");
        Scanner sc2 = new Scanner(System.in);
        String strh = sc.nextLine();
        try {double w = Double.parseDouble(strw);}catch (NumberFormatException e){
            System.err.println("Error: numbers required for width and height!");
            System.exit(1);
        }

        double w = Double.parseDouble(strw);
        double h = Double.parseDouble(strh);

        try{Rectangle R = new Rectangle(w, h);}
        catch (IllegalArgumentException e){
            System.err.println(e);
            System.exit(1);
        }

        Rectangle R = new Rectangle(w, h);
        System.out.println(R);
        System.out.printf("Area %1.3f\n", R.area());
        System.out.printf("Perimeter %1.3f\n", R.perimeter());
        }
}
