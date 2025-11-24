  //////////
 // Math //
//////////
// The built-in Math object has properties and methods for mathematical constants and functions
// Unlike many other objects, you never create a Math object of your own. You always use the built-in Math object.

// Math Constants
Math.E                  // returns Euler's number
Math.PI                 // returns PI
Math.SQRT2              // returns the square root of 2
Math.SQRT1_2            // returns the square root of 1/2
Math.LN2                // returns the natural logarithm of 2
Math.LN10               // returns the natural logarithm of 10
Math.LOG2E              // returns base 2 logarithm of E
Math.LOG10E             // returns base 10 logarithm of E



// Basic methods
Math.max(x, y, z, n)	        // Returns the number with the highest value
Math.min(x, y, z, n)	        // Returns the number with the lowest value
Math.abs(x)                  // Returns the absolute value of x
Math.sign(x)	                // Returns if x is negative, null or positive (-1, 0, 1)
Math.trunc(x)	              // Returns the integer part of a number (x)
Math.random()	              // Returns a random number between 0 and 1



// Exponentiation methods
// powers
Math.pow(x, y)             // Returns the value of x^y
Math.sqrt(x)	              // Returns the square root of x
Math.cbrt(x)	              // Returns the cubic root of x
Math.exp(x)	              // Returns the value of E^x
Math.expm1(x)	            // Returns the value of E^x-1
// logs
Math.log(x)	              // Returns the natural logarithm (base E) of x
Math.log1p(x)	            // Returns the natural logarithm of 1 + x
Math.log10(x)	            // Returns the base-10 logarithm of x
Math.log2(x)	              // Returns the base-2 logarithm of x



// Rounding methods
Math.round(x)	            // Rounds x to the nearest integer
Math.ceil(x)	                // Returns x, rounded upwards to the nearest integer
Math.floor(x)	            // Returns x, rounded downwards to the nearest integer



// Trig methods
// Basic
Math.sin(x)	                // Returns the sine of x (x is in radians)
Math.cos(x)	                // Returns the cosine of x (x is in radians)
Math.tan(x)	                // Returns the tangent of an angle
// Hyperbolic
Math.sinh(x)	                // Returns the hyperbolic sine of x
Math.cosh(x)	                // Returns the hyperbolic cosine of x
Math.tanh(x)	                // Returns the hyperbolic tangent of a number
// Arc
Math.asin(x)	                // Returns the arcsine of x, in radians
Math.acos(x)	                // Returns the arccosine of x, in radians
Math.atan(x)	                // Returns the arctangent of x as a numeric value between -PI/2 and PI/2 radians
// Hyperbolic arc
Math.asinh(x)	            // Returns the hyperbolic arcsine of x
Math.acosh(x)	            // Returns the hyperbolic arccosine of x
Math.atanh(x)	            // Returns the hyperbolic arctangent of x
Math.atan2(y, x)	            // Returns the arctangent of the quotient of its arguments



// Bit Math methods
Math.clz32(x)	            // Returns the number of leading zeros in a 32-bit binary representation of x
Math.fround(x)	            // Returns the nearest (32-bit single precision) float representation of a number
