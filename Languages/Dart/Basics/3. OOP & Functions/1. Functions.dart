  ///////////////
 // Fucntions //
///////////////
/// Dart has a lexical scope so functions are scoped
/// Dart functions always return a value (if void then returns null)

// Basics
f1(n) {return n;}                                 // although non actually needed
int f2(int n) {return n;}                         // it is good practice to specify argument and return values' data types
int f3(int n) => n;                               // can use function expression shorthand if the function has 1 expression
void f4(int n) => print(n);
var call = f1(20);                                // calling functions

var l1 = [];
var buffer = StringBuffer();
var add1 = l1.map((p1) => p1+1).toList();         // an anonymous function (also called a lambda)


// Parameters
// A function can have positional params and then either names or optional params
void f5({int? namedParam}){}                                      // put named params in {} and must have a value so
void f6({bool? p1, bool p2 = true, required int p3, p4}) {}       // must be nullable, have a default value or be marked as required
var call2 = f6(p3: 3);                                            // syntax for setting named args
void f7(int p1, int p2, {int? namedParam}){}                      // named params must go at the end of the args
void f8(int p1, [String? optionalParam, int p3=5]){}              // optional positional params must be nullable or have a default value


// Main function
// Every app has to have a void main function which is what runs when you run the app
// This is useful
void main(List<String> arguments) {                     // main has an options List<String> parameter for arguments
  assert(arguments.length == 2);                        // run the app like this: dart run args.dart 1 test
  assert(int.parse(arguments[0]) == 1);                 // so the first arg will be 1  
  assert(arguments[1] == 'test');                       // and the second will be 'test'
}


// Functions as objects
// Dart is truly oop so functions are objects so they can:
void f9(f1){}             // be passed as parameters
var v1 = (p1) => p1;      // and assigned to variables


// Lexical closures
// Closure - a function object that can access variables in its lexical scope when the function sits outside that scope
Function makeAdder(int addBy) {return (int i) => addBy + i;}                       // allows you to make functions that adds to the addBy variable 
void run() {
  int i = 2;
  var add2 = makeAdder(i);                                                         // creates a function that adds 2
  print(add2(3) == 5);                                                             // the add2 function has saves the 2 that was passed to it to create it
}


// Tear-offs
// Tear-offs are created when you use a function, method or named class constructor without parentases e.g. print instead of print()
// They are closures that take the same parameters as functions and invoke the underlying functions
void tearOffs(){
  l1.forEach((i)=>print(i));              // for each takes in a function but instead of using a lambda like this we can use a
  l1.forEach(print);                      // function tear-off like this
  l1.forEach(buffer.write);               // method tear-off
}