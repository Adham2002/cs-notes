  ////////////////
 // Data Types //
////////////////
// All dart variabels are objects, instances of classes that are subtypes of the object class
// This file describes most of the built in classes in Dart (can be used without importing anything or defining a new class)
// We can check the run time type of a variable using the runtimeType property
// Runtime type may be different from pre compile type as for example unless specified otherwise Maps have runtime type Map<dynamic,dynamic>
void displayType(variable){print(variable.runtimeType);}
Object a = 1;



// Booleans
bool t  = true;
bool f = false;



// Numbers
num b = 1;          // num is a superclass of int and double and has math operators like +, /, abs(), floor() etc. but no bitwise operators like >>>
int c = 1;          // <64 bit integer (64 bits on native platforms and 53 bits for integer part on the web)
double d = 1;       // exactly 64 bit float
var hex = 0xEF;           // use hex code to define the the integer 239
var y = 1.1;              // this is a double as it is a decimal number
var exponents = 1.42e5;   // same as 1.42 x 10^5



// Strings
// Uses UTF-16 encoding
var s1 = 'Single quote can have \'s and "s';
var s2 = "Single quote can have 's and \"s";
var s3 = 'Can use string interpolation like this $s1 if the expression is a single identifier';
var s4 = 'Otherwise us ${s1.toUpperCase()}';
var s5 = '''You can create
          multi-line strings like this''';
var s6 = r'In a raw string, not even \n gets special treatment.';
var s7 = 'Unicode character can be inserted like \u2665 if there hex code is 4 digit and \u{3} if it is > or < 4 digits';



// Collections
// Lists
List arr = [1, 2, 3];

// Sets (exactly like sets in maths or python)
Set halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
// create an empty set
Set set1 = {};
var set2 = <String>{};
var set3 = Set();

// Maps  (darts implementation of Hasmaps similar to dictoinaries in python)
var map = {};                             // create an empty set
Map map2 = Map<String, String>();         // 

// Records
// these are immutable and have fixed length like tuples in python but can also have named field as well as positional ones
var record = ('first', a: 2, b: true, 'last');



// Runes
// runes are integers corresponding to the Unicode code point (e.g. ♥ = \u2665 = 9829) that string are made out of
Runes r1 = Runes("sr");         // iterable of runes stores as the integers (115, 114) 
Runes rune = s1.runes;



// Symbols
// A Symbol object represents an operator or identifier declared in a Dart program
// they're invaluable for APIs that refer to identifiers by name, because minification changes identifier names but not identifier symbols
// Symbol literals are compile-time constants.
Symbol symbol = #radix;       // gets the symbol for the radix identifier



// Inline function types
// Function types define the datatypes of function args
// They are used when you store functions like variables 
// e.g. in a list, as a return type, variable declaration, ... 
void Function(String, int)? inlineFunctionTypes(String s1) {                // the retrun type is this function is either null or void Function(String, int)? (a function that takes a string and int)
  final bool Function(Map) f1;                                              // this variables type is bool Function(Map) (a funtion that returns a bool and takes a map as an arg)
  final List<Set Function(int)> f2;                                         // this Lists's elements type is Set Function(int)
  void Function(String, int)? last;                                         // this variable matches the return variable so the function can return it
  return last;
}



// Converting and casting
var S_to_I = int.parse('1');                              // String -> int
var S_to_D = double.parse('1.1');                         // String -> double
var S_to_B = bool.parse('true');                          // String -> bool
var S_to_L = 'list'.split('');                            // String -> List

var I_to_S = 1.toString();                      // int -> String
var I_to_D = 1.toDouble();                      // int -> Double

String piAsString = 3.14159.toStringAsFixed(2);         // double -> String



// Typedefs
// Allows you to create new syntax to refer to a new type 
// they must be defined at the top level of a file (global scope)
typedef IntList = List<int>;
IntList il = [1, 2, 3];

Map<String, List<String>> m1 = {};                    // Verbose
typedef ListMapper<X> = Map<X, List<X>>;
ListMapper<String> m2 = {};                           // Same thing but shorter and clearer.

typedef Compare<T, P> = int Function(T a, P b);       // can use function typedefs but inline function types are preffered
void typedef(){
  final int Function<T, P>(T a, P b) g;                 // same as this
}
