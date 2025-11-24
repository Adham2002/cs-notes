  ////////////////
 // Data Types //
////////////////
// JS has a set of primative types and everything else is an object (primative types: string, number, bigint, boolean, undefined, null, symbol)
// Javascript has object wrappers for each primative that it wraps primatives with when calling methods on them
// Javascript is dynamically typed, like python it's type is infered from it's value and can change as it's value changes


// Dynamic typing
let d;              // Now d is undefined
d = 5;              // Now d is a Number
d = "John";         // Now d is a String

// Get the data type of a variable
typeof v        // Returns "string"
typeof 0        // Returns "number"

// Strings
let color = "Yellow";
let lastName = "Johnson";

// Numbers (or double - 64-bit floating point)
let length = 16;
let weight = 7.5;
let big = 123e5;             // 12300000
let small = 123e-5;         // 0.00123

// Bigint (can store number too big to be represented as a double)
let big_num = BigInt("9999999999999999n");
let big_num2 = 9999999999999999n;

// Booleans
let t = true;
let tn = true;        // like in python any num > 0 is true
let f = false;
let fn = true;        // and 0 is false

// Undefined
let u;                    // u will default to being undefined
let u2 = undefined;       // can also initialise as undefined (redundant)
t = undefined;            // can empty a variable by setting it to undefined

// Null
let n = null;

// Symbol
// Symbols have optional string-valued parameter is a descriptive string that is shown when printing the symbol
const symbol = Symbol('description')            // new and unique symbol is created


// Object
// This is like if you could create objects without instansiating a classes in python
// Good practice to declare objects as constants so it can't be reassigned
const person = {                                    // regualr object with properties
    firstName: "John",
    lastName : "Doe",
    id       : 5566,
    fullName : function() {
      return this.firstName + " " + this.lastName;
    }
  };
let cars = ["Saab", "Volvo", "BMW"];                // array object
let date = new Date("2022-03-25");                  // date object

