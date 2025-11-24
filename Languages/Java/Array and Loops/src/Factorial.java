public class Factorial {
    public static void main(String[] args) {
        int number = 1;
        if (args.length > 0) {
            try {
                number = Integer.parseInt(args[0]);
            } catch (NumberFormatException e) {
                System.err.println("Argument " + args[0] + " must be an integer.");
                System.exit(1);
            }
        }

        else {
            System.out.print("Error: no value supplied");
            System.exit(1);
        }
        if(number>12||number<0){
            System.out.print("number too big integer overflow occurred");
            System.exit(1);
        }

        int answer = 1;
        for(; number>0; number--){
            answer=answer*number;
        }
        System.out.println(answer);
    }
}
