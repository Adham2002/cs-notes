  //////////////
 // Variable //
//////////////
/// C# variables are statically typed so everything has a data type at compile time
/// C# variables are statically typed so once defines a variables type can never change

// Implicit vs explicit typing
// Type can be set explicitly by specifying the type or implicitly using var keyword (infers type from value)
int explicitVar = 10;       // explicitly typed
var implicitVar = 10;       // implicitly typed
implicitVar = false;        // will throw a compile time error as we are changing type
object name = "Bob";        // allows variables to be changed to any data type
dynamic name2 = "Bob";      // same as Object but has all the properties and methods of every type


// Constant variables
const int num = 1729;       // value of constant variables can never be changed