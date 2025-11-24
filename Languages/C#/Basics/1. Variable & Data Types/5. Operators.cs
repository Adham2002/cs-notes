  ///////////////
 // Operators //
///////////////
dynamic a = 5;
dynamic b = 1;


// Arithmetic Operators
void arithmetic_Operators(){
  5 + 2;    // 7                // Addition 
  7 - 2;    // 5                // Subtraction 
  2 * 2;    // 4                // Multiplication 
  pow(3,2); // 9                // Exponentiation 
  6 / 3;    // 2                // Division (returns double)
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
  a %= 4;  // 2                // Modulo assignment
  a <<= 1;                     // Bitwise Left Shift assignment
  a >>= 1;                     // Bitwise Right Shift assignment
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
  5 | 1;	                   // bitwise OR
  ~ 5;                         // bitwise NOT/ compliment (0s become 1s; 1s become 0s)
  5 ^ 1;                       // bitwise XOR
  5 << 1;                      // bitwise left shift
  5 >> 1;                      // bitwise right shift
}


// Ternary Operators
void ternary_Operators(){
  a = (b < 18) ? "Too young":"Old enough";
  // Nullish Coalescing Operator
  a = a ?? b;                 // returns a unless it is null (returns b if null)
}


// Type Operators
void type_Operators(){
  a as String?;              // casts a to string or null if cast is not possible 
  a is String;	            // Returns true if a is a string
  a is! String;	            // Returns true if a is NOT a string
}


// Null Conditional Operators
void null_Operators(){
  a?[1];               // accessing 1st element array but evaluates to null if a is null
  a?.colour;           // accessing colour propertiy but evaluates to null if a is null
  a!.colour;           // ! casts a to non-nullabe type and throws a runtime exception if a is null
}
