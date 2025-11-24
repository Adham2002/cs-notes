  /////////////
 // Classes //
/////////////
/// Dart is an object-oriented language so everything is an object (an instance of a class)
/// All classes except Null descend from the top level class Object and only have 1 superclass (no multiple inheritance)
/// Interface - a set of methods and properties that any class trying to implement should have (every class implicitly defines an interface)
/// Mixin-based inheritance - although every class except Object has 1 superclass, a class body can be reused in multiple class hierarchies using mix-ins
/// Proterties, constructors and methods can be defined anywhere in the class (proterties don't have to go above constructors or mthods)



// Instance variables
// Also called properties or instance variables but google documentation mostly uses instance variables
// All instance variables implicitly generate getter methods (accessed through Class.getterName) to access them
// Instance variables that are non-final or late final implicitly generate setter methods used to set them
// All instance variables (except late ones) must be initialised when the instance is created (before constructor body executes)
class InstanceVariables {
  // Initialising instance variables
  String? p1;                                                       // due to the last fact instance variables have to be nullable
  int p2 = 0;                                                       // or initialised when declared
  late int p3;                                                      // or late
  int p4;                                                           // or set before the constructor body runs using:
  InstanceVariables(this.p4){p3=2;}                                     // Initiaslising Formal Parameters (simplifies assignment)
  InstanceVariables.initList(Map containsParams):                       // Initializer Lists
    p4 = containsParams['p4'],                                          // these allow you to use paramenters to set instance variables unlike initiaslising formal parameters
    p1 = containsParams['p1'],                                          // notice these both come before the constructor body in the code to show they are run first
    super(){}                                                           // The super constructor can be called at the end of the initalizer list

  // getter and setters
  double? get p7 => p2.toDouble();                                  // getter method is called whenever the variable is accesses (replaces implicit getter method)
  void set p3Set(p3New) => this.p3 = p3New;                         // setter method and can be called to 

  // other useful info
  late var p5 = this.p1;                                            // late variable can access 'this' as they are lazily initialised
  static int p6 = 0;                                                // static (class wide) variablles belong to the class instead of any one instansiation
  int? _p8;                                                         // private properties can only be accessed by from the same Library scope (mostly the same as file scope)
  InstanceVariables.setPriv({required this.p4, required p8}):       // private proterties can't be used as NAMED inilialising formals
    _p8 = p8;                                                       // but can just be defnied in an initializer list
  InstanceVariables.withAssert(this.p4) : assert(p4 >= 0) {}        // assert can be used to validate inputs during development
}



// Constructors
// Constructors can be default, generative, named, redirecting, factory or constant
// if no constructors are declared a default constructors is used to create new instances (it doesn't take arguments and isn't named)
class Constructors {
  final String p1;
  final int p2;

  Constructors(this.p1, this.p2) {print('h');}                               // Generative constructor uses class name
  Constructors.named(this.p1, this.p2);                                      // Named constructor allow for different constructors to be used in differend contexts (not inherited)
  Constructors.named2(String p1, int p2): this.named(p1, p2);                 // Redirecting constructor uses the initialiser list to redirect to another constructor (cannot have it's own body)

  // Factory constructor
  // These are used when you need:
  // a constructor to not return a new instance of the class (maybe a cached instance that already exists or a subclass of that class)
  // to perform non-trivial work prior to the constuctor body running (safer than using late)
  factory Constructors.fromJson(Map<String, Object> json) {
    String param1 = json['p1'].toString();
    param1 = param1[0].toUpperCase() + param1.substring(1).toLowerCase();

    int param2 = json['p1'] as int;
    param2 *= 3;

    return Constructors(param1, param2);                                     // factory method connot access this so we redirect to the generative consructor one we have proccessed the variables
  }
}
// constant constructors
class ImmutablePoint {
  final double x, y;                            // all instance variables must be final or const
  const ImmutablePoint(this.x, this.y);         // 
}



// Methods
// Methods are just functions that can access a classes proterties so there isn't much to learn
// some unique methods are operators, getters and setters shown earlier and abstract methods
class Methods{
  int p1;
  String p2;

  Methods(this.p1, this.p2);

  // Operators
  // most operators are instance methods of Object so we have to override then in any class (all classes are subclasses of Object)
  // the most common operator to override is == as the defualt behaviour is to only return true if both objects are instances of the same class
  @override
  bool operator ==(Object other) => other is Methods && p1 == other.p1 && p2 == other.p2;             // operator keyword required to define operator methods
  @override                                                                                           // if 2 objects are equal they should have the same hashcode (as Set and Map use hashcodes)
  int get hashCode => Object.hash(p1, p2);                                                            // SO ALWAYS override hashCode getter when overriding == and vice versa
}



// Inheritance
/// inheritance in Dart is implementing by using the extends keyword to create a subclass and super keyword to refer to superclass methods and fields
/// Dart does not support multiple inheritance (when a class inherits from more than 1 class)
class InheritanceSuperclass{
  String p1;
  int p2;
  InheritanceSuperclass(this.p1, this.p2);
  String hello(){return 'hello';}
}

// Subclass inherits all fields and methods 
class InheritanceSubclass extends InheritanceSuperclass {
  double p3;
  InheritanceSubclass(super.p1, super.p2, this.p3);        // this constructor implicitly calls the super constructor and must instasiate all non late fields including all inherited ones
  @override                                                // instance methods can be overriden but the return type, parameter list shape and whether it is generic or not must stay the same
  String hello(){return super.hello() + 'hello';}          // can use any superclass methods using the super keyword
}



// Callable objects
// Dart allows instances of classes to be called like functions using the call method
class CallableClass {
  String call() => 'wow you called the class';
}
var cc = CallableClass();
void main() => print(cc());