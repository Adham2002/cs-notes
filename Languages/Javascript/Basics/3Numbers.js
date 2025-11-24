  /////////////
 // Numbers //
/////////////
// In JavaScript, numbers are implemented in double-precision 64-bit binary format IEEE 754 (1 bit for the sign ±, 11 exponent bits and 52 mantisa bits)
// Format: (-1)^s x 1.F x 10^e where s is the sign (±), F is the fractional part of the mantisa and e is the exponent (the 1 is implicit and so is not stored)
// Exponent coding: uses offset-binary notation of 1023 so 00000000001 represent e = 1-1023. There are also some special encodings:
    // 00000000000 changed the implicit 1 in the mantisa to a 0 so we can have 53 bits of precision
    // 11111111111 represents ∞ if F = 0
    // 11111111111 represents NaN if F != 0



// Number bases and exponentiation
// Numbers can be decimal, binary, octal and hexadecimal
// Scientific notation of exponents can also be used for shorter syntax but only with decimal numbers
// Number bases
let oct = 0o2           // use 0o or 0O prefix for octal 
//let legacy_oct = 02     // legacy syntax also allows just 0 prefix followed by digits between 0-7 but this will raise an error in strict mode
let hex = 0o1           // use 0x or 0X prefix for hex
let bin = 0b10000       // use 0b or 0B prefix for binary
let dec = 16            // no prefix needed for decamal
// Exponents
let pos_exponent = 5e1          // use e or E foe exponent
let neg_exponent = 175E-2       // can have negative exponents



// Number object
// Number object wrap around primative number to provide access to number properties and methods
// Properties
const biggestNum = Number.MAX_VALUE;                    // largest positive representable number (1.7976931348623157e+308)
const smallestNum = Number.MIN_VALUE;                   // smallest positive representable number (5e-324)
const epsilon = Number.EPSILON                          // 	1 - smallest value greater than 1 that can be represented as a Number (2.220446049250313e-16)
const infiniteNum = Number.POSITIVE_INFINITY;           // special positive infinite value; returned on overflow
const negInfiniteNum = Number.NEGATIVE_INFINITY;        // special negative infinite value; returned on overflow
const notANum = Number.NaN;                             // special "not a number" value different from null as it is still technically a number type
// Static methods
Number.parseFloat('3.3')	    // parses string to float (ame as the global parseFloat())
Number.parseInt(1/0)	        // parses a string to integer of the specified base (ame as the global parseInt())
Number.isFinite(1/0)	        // returns true is number is finite and false is num is infinite or NaN
Number.isInteger(3)
Number.isNaN()
Number.isSafeInteger()          // determines if precision is lost when storing value (values that require more than 53 bits of precision to store)
// Methods
toExponential()	    // returns a string in exponential notation
toFixed()	        // returns a string in fixed-point notation
toPrecision()	    // same as above but can specify num of sig figs



// BigInts
