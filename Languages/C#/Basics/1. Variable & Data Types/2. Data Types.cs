  ////////////////
 // Data Types //
////////////////
// All C# variables are objects, instances of classes that are subtypes of the object class
// This file describes most of the built in classes in Dart (can be used without importing anything or defining a new class)
// We can check the run time type of a variable using the runtimeType property
// Runtime type may be different from pre compile type as for example unless specified otherwise Maps have runtime type Map<dynamic,dynamic>
Object a = 1;

// Booleans
bool t  = true;
bool f = false;


// Numbers
// Each of the following has an unsigned counterpart byte, ushort, uint, ulong, 
sbyte n1 = 8;                   // 8 bit whole number
short n2 = 16;                  // 16 bit whole number
int n3 = 32;                    // 32 bit whole number
long n4 = 64L;                  // 64 bits whole number (use l/L suffix for implicit long typing)
float n5 = 32F;                 // 32 bit floating point number (use f/F suffix for implicit float typing)
double n6 = 64.0D;              // 64 bit floating point number (use d/D or .0 suffix for implicit double typing)
decimal n7 = 128M;              // 64 bit floating point number (use m/M for implicit decimal typing)

var exponents = 1.42e5;//= 1.42 x10^5           // use e/E like x10^ to define floating point numbers (defaults to double unless f/F suffix)
var hex = 0xEF;// = 239                         // use 0x/0X prefix and hexadecimal number to define the integer 
var bin = 0b11;// = 3                           // use 0b/0B prefix and binary number to define the integer 


// Strings and chars
char ch = 'D';              // use '' to define a single unicode character (16 bits or 2 bytes)
string str = "Hello";       // use "" to define a sequence of chars


// Finding types
typeof(a);          // gets runtime type of instance 
a.GetType;          // runtime type also stored as a property


// Casting and conversion
// We cannot change the type of a variable but we can convert or cast it's value to a different type and then save it as a new variable
// Implicit casting converts a smaller type to a larger type size (in terms of bits stored) e.g. int ->  double
// Explicit casting converts a larger type to a smaller type size e.g.  double -> int
// Converting runs some method that creates a new value using the old value somehow
double c2 = 9;                      // implicit cast doesn't change stored bits, just tells the compiler to read them differently
int c1 = (int)42.5;                 // explicit cast needs to drop some bits (.5 in this case) so explicit syntax is required
int c3 = Convert.ToInt32("123");    // conversion parses string into an integer
