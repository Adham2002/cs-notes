public class Rectangle {
    private double width;
    private double height;

    public Rectangle(){this(1.0,1.0);}

    public Rectangle(double w, double h){
        width = w;
        height = h;
    }

    public double GetWidth(){
        return width;
    }

    public double GetHeight(){
        return height;
    }

    public double area(){
        return width*height;
    }

    public double perimeter(){
        return 2*(width+height);
    }

    @Override
    public String toString(){
        return String.format("Rectangle: %1.3f x %1.3f",width,height);
    }
}
