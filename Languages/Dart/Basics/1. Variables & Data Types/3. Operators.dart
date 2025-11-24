  ///////////////
 // Operators //
///////////////
/// All operator are listed in decending order of precidence here:
/// https://dart.dev/language/operators#operators

import 'dart:math';
dynamic a = 5;
dynamic b = 1;


// Arithmetic Operators
void arithmetic_Operators(){
  5 + 2;    // 7                // Addition 
  7 - 2;    // 5                // Subtraction 
  2 * 2;    // 4                // Multiplication 
  pow(3,2); // 9                // Exponentiation 
  6 / 3;    // 2                // Division (returns double)
  6 ~/ 4;   // 1                // Floor division (returns int)
  8 % 3;    // 2                // Modulus 
  b = ++a;  // b = 5, a= 6      // Increment a before b gets its value
  b = a++;  // b = 6, a= 6      // Increment a after b gets its value
  b = --a;  // b = 5, a= 4      // Decrement a before b gets its value
  b = a--;  // b = 4, a= 4      // Decrement a after b gets its value
}


// Assignment Operators
void assignment_Operators(){
  a = 1;                       // Assignment
  a += 2;  // 3                // Addition assignment
  a -= 1;  // 2                // Subtraction assignment
  a *= 6;  // 12               // Multiply assignment
  a /= 2;  // 6                // Divide assignment
  a ~/= 2; // 6                // Floor divide assignment
  a %= 4;  // 2                // Modulo assignment
  a <<= 1;                     // Bitwise Left Shift assignment
  a >>= 1;                     // Bitwise Right Shift assignment
  a >>>= 1;                    // Bitwise Unsigned Right Shift assignment
  a &= 1;                      // Bitwise AND 
  a ^= 1;                      // Bitwise OR
  a |= 1;                      // Bitwise compliment assignment
}
 

// Comparison Operators
void comparison_Operators(){
  a == b;	                    // equal value (returns x.==(y) see operators section in Classes.dart for more detail on how this works with classes)
  identical(a, b);            // refer to the same object
  3 != 3;	                    // not equal
  3 > 3;	                    // greater than
  3 < 3;	                    // less than
  3 >= 3;	                    // greater than or equal to
  3 <= 3;	                    // less than or equal to
}


// Logical Operators
void logical_Operators(){
  b && b;	                  // logical and
  b || b;                   // logical or
  !b;	                      // logical not
}


// Bitwise Operators
void bitwise_Operators(){
  5 & 1;                       // bitwise AND
  5 | 1;	                     // bitwise OR
  ~ 5;                         // bitwise compliment (0s become 1s; 1s become 0s)
  5 ^ 1;                       // bitwise XOR
  5 << 1;                      // bitwise left shift
  5 >> 1;                      // bitwise right shift
  5 >>> 1;                     // bitwise unsigned right shift
}


// Ternary Operators
void ternary_Operators(){
  a = (b < 18) ? "Too young":"Old enough";
  // Nullish Coalescing Operator
  a = a ?? b;                 // returns a unless it is null (returns b if null)
}


// Type Operators
void type_Operators(){
  a as String;              // Typecast a as a string
  a is String;	            // Returns true if a is a string
  a is! String;	            // Returns true if a is NOT a string
}


// Spread Operators
void spread_Operators(){
  // provide a concise way to insert multiple values into a collection
  dynamic list = [Null, 2, 3];
  List list2 = [0, ...list];       // inserts all values of list at the end of list2
  list = Null;
  List? list3 = [0, ...?list];     // use null-aware spread operator to allow list to be null
}


// Null Conditional Operators
void null_Operators(){
  a?[1];               // accessing 1st element array but evaluates to null if a is null
  a?.colour;           // accessing colour propertiy but evaluates to null if a is null
  a!.colour;           // ! casts a to non-nullabe type and throws a runtime exception if a is null
}



  ///////////////
 // Cascading //
//////////////
   
class Paint{
  String? colour;
  double? strokeWidth;
  Paint(this.colour, this.strokeWidth) {}

  String? changeColour(newColour){
    this.colour = newColour;
    return this.colour;
  }
}

void cascading(){
  var paint = Paint("blue", 2.0)      // cascades allow you to make a sequence of operations on the same object
  ..colour = "black"                  // same as paint.coluor = "black"
  ..strokeWidth = 5.0                 // same as paint.strokeWidth = 5.0
  ..changeColour("Red");              // same as paint.changeColour()  but ignoring return value

  // null-shorting cascade
  a                                     // a is nullabe as dynamic can be any type
  ?..colour = "black"                   // same as a.?coluor = "black" (operation not attempted if a is null)
  ..strokeWidth = 5.0;                  // same as a.?strokeWidth = 5.0

  /* nested cascading
  final addressBook = (AddressBookBuilder()
      ..name = 'jenny'
      ..email = 'jenny@example.com'
      ..phone = (PhoneNumberBuilder()
            ..number = '415-555-0100'
            ..label = 'home')
          .build())
    .build();
  */
}