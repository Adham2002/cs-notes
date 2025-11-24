  ///////////////
 // Operators //
///////////////

// Arithmetic Operators
5 + 2;  // 7                // Addition 
7 - 2;  // 5                // Subtraction 
2 * 2;  // 4                // Multiplication 
3 ** 2; // 9                // Exponentiation 
6 / 3;  // 2                // Division 
8 % 3;  // 2                // Modulus 
x = 1;
x++;    // 2                // Increment 
x--;    // 1                // Decrement
a = ++x;                    // Increment before assignment (same as a=x; x++;)
b = --x;                    // Decrement before assignment (same as a=x; x++;)


// Assignment Operators
y = 1                       // Assignment
y += 2  // 3                // Addition Assignment
y -= 1  // 2                // Subtraction Assignment
y *= 6  // 12               // Multiply Assignment
y /= 2  // 6                // Divide Assignment
y %= 4  // 2                // Modulo Assignment
y **= 4 // 16               // Exponentiation Assignment


// Comparison Operators
3 == 3	                    // equal to
3 === 3	                    // equal value and equal type
3 != 3	                    // not equal
3 !== 3	                    // not equal value or not equal type
3 > 3	                    // greater than
3 < 3	                    // less than
3 >= 3	                    // greater than or equal to
3 <= 3	                    // less than or equal to


// Logical Operators
true && true	              // logical and
true ||	false               // logical or
!false	                    // logical not


// Bitwise Operators
5 & 1 ;                     // bitwise AND
5 | 1	                      // bitwise OR
~ 5                         // bitwise NOT
5 ^ 1                       // bitwise XOR
5 << 1                      // bitwise left shift
5 >> 1                      // bitwise right shift
5 >>> 1                     // bitwise unsigned right shift


// Ternary Operators
// ternary operator
let voteable = (age < 18) ? "Too young":"Old enough";
// Nullish Coalescing Operator
let result = var1 ?? var2;  // returns var1 unless it is null (returns var2 if null)
// Optional Chaining Operator
let demo = object ?. err    // returns undefined if an object is undefined or null (instead of throwing an error).


// Type Operators
typeof "string"	            // Returns the type of a variable
instanceof obj	            // Returns true if an object is an instance of an object type
