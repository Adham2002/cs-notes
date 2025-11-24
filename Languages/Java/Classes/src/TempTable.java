public class TempTable {
    static double FahrenheitToCelsius(double TempF) {
        return(((TempF - 32) * 5) / 9);
    }
    public static void main(String[] args) {
        System.out.println("+-----------+----------+");
        System.out.println("|     \u00b0F    |    \u00b0C    |");
        System.out.println("+-----------+----------+");
        double Temp = 20;
        while(Temp<=100){
            System.out.printf("|   %5.1f   |   %4.1f   |\n",Temp,FahrenheitToCelsius(Temp));
            Temp=Temp+5;
        }
    }
}
