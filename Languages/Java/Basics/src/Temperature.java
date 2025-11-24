import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Scanner;

public class Temperature {

    private static String[] Split(String inputLine) {
        String[] args = new String[0];

        if (inputLine.contains("\"")) {
            args = inputLine.split(" ", 3);
            if (args[2].charAt(0) == '\"' && args[2].charAt(args[2].length() - 1) == '\"') {
                args[2] = args[2].replace("\"", "");
            } else {return null;}
        }
        return args;
    }

    public static void main(String[] args) {
        //String var = "join 1 \"barry barry\"";
        //String[] args2 = Split(var);
        //System.out.println(Arrays.toString(args2));
        try {
            System.out.println(Integer.parseInt(args[0]));
        }catch (NumberFormatException e){
            System.err.println("second argument should be a number");
        }
    }
}
