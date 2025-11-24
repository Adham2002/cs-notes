import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Dataset {
    private static List<Double> data = new ArrayList<>();

    public Dataset(String filename) throws IOException {
        if (!Files.isReadable(Paths.get(filename))) {throw new FileNotFoundException("Error: file not found");}
        try (Scanner file = new Scanner(Paths.get(filename))) {
            while (file.hasNextLine()) {
                data.add(Double.parseDouble(file.nextLine()));
            }
        }
    }

    public int size() {
        return data.size();
    }

    public double meanValue() {
        if (data.size() == 0) {
            throw new ArithmeticException();
        }
        double sum = 0;
        for (double num : data) {sum += num;}
        return sum / data.size();
    }
}