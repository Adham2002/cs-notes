  ///////////////
 // Variables //
///////////////

String IntToStr(int num){return num.toString();}

void main() {
  // var
  var name = "Bob";         // var keyword infers the variable type from the value
  String name2 = 'Bob';     // data type can also be explicitly declared

  Object name3 = 'Bob';     // allows variables to be changed to any data type
  dynamic name4 = 'Bob';    // same as Object but has all the properties and methods of every type


  // Null Safety (must be enabled)
  // Null safety - the dart compiler detects potential errors to do with accessing methods and properties of null variables
  // Null safety introduces three key changes:
  String? name5;                         // ? allows variable to have null type (nullable variable default to null value)
  var name6 = "Bob";                     // all non nullable variables must be initialised before use
  name5.toString();                      // this will raise an error as you can't access properties or call methods on nullable variable
  dynamic name7 = null;                  // dynamic variables can be null
  late String  name8;                    // doesn't trigger compilation errors if dart thinks name8 hasn't been initialised
  late String name9 = IntToStr(4);       // lazy initialisation - variable initialised when first used ()


  // Final & Const
  const String name10 = 'Bob';              // initialised when code is compiled and cannot be changed after
  var foo = const [];                       // foo has been assigned a value that is constant so cannot be changed
  foo = [1, 2, 3];                          // while the value pointed to cannot be changed foo is still a variable and can be reassigned
  final DateTime date = DateTime.now();     // initialised during run time when this line is reached and connot be changes after
  
}

