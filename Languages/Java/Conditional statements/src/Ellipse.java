import java.util.Scanner;

public class Ellipse {
    public static void main(String[] args) {
        System.out.print("enter the length of the semi-major axis a ");
        Scanner sc = new Scanner(System.in);
        double a = sc.nextDouble();
        if(a<=0) {
            System.out.print("Error: semi-major axis length must be > 0");
            System.exit(1);
        }

        System.out.print("enter the length of the semi-major axis b ");
        Scanner sc2 = new Scanner(System.in);
        double b = sc2.nextDouble();
        if(b<=0) {
            System.out.print("Error: semi-major axis length must be > 0");
            System.exit(1);
        }

        if(b>a) {
            System.out.print("Error: semi-major axis must be longer than semi-minor axis");
            System.exit(1);
        }

        double area = Math.PI*a*b;
        double eccentricity = Math.sqrt(1-Math.pow((b/a),2));
        System.out.printf("The ellipse has an area of %1.3f and an eccentricity %1.3f", area, eccentricity);
    }
}
