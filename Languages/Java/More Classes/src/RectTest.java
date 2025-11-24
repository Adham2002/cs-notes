import java.util.Scanner;

public class RectTest {
    public static void main(String[] args) {
        Rectangle R1 = new Rectangle();

        System.out.println(R1);
        System.out.printf("Area %1.3f\n",R1.area());
        System.out.printf("Perimeter %1.3f\n",R1.perimeter());
        System.out.println();

        System.out.print("Enter rectangle width: ");
        Scanner sc = new Scanner(System.in);
        int w = sc.nextInt();
        System.out.print("Enter rectangle height: ");
        Scanner sc2 = new Scanner(System.in);
        int h = sc2.nextInt();
        Rectangle R2 = new Rectangle(w,h);

        System.out.println(R2);
        System.out.printf("Area %1.3f\n",R2.area());
        System.out.printf("Perimeter %1.3f\n",R2.perimeter());
    }
}
