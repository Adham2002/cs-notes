  ///////////////
 // Variables //
///////////////
// Can use var (outdated), let or const to declare variables
// Block Scope - Variables declared inside a { } block cannot be accessed from outside the block
// Hoisting - variable declarations can be hoisted to the top of the block scope


// Multiple variables can be declared with one statement
var a = 1, b = 2;

// let
let x = 2;              // global let variables are added to a scripts lexical scope but not to the global object (window or globalThis for Node.js)
{
  let x = 2;            // let variables can only declare block scope local variabels
  //let x = 0;          // cannot redeclare variables using let (raises a syntax error at compilation which most IDEs pickup)
  e = 6;                // let declarations are hoisted but not initialisation (even to undefined) so cannot be accessed until declared
  let e;                // they exist in a Temporal Dead Zone (TDZ) from the start of their enclosing block until their declaration
}



// Var
// let was introducted in 2015 so use ONLY var for old websites
var c = 2; console.log(window.c);   // global var variables are added as a property of window
globalThis.c                        // or globalThis in Node.js
var c = 0;                          // redeclaring is allowed with var
e = 6; var e;                       // var declarations are hoisted to the top of the current scope but initialised to undefined until asigned a value
{let c = 2;}                        // can be redeclared with let in block scope so outside the Block Scope c = 0


// Constants
// Constants do not define a constant value but instead define a constant reference to a value
// For this reason it is good practice to define arrays, objects, functions and RegExps as constants
// Have all the same properties as let except they:
  // Must be assigned when declared 
  // Cannot be reassigned
const y = 6;
y = 5;                                      // Cannot be reassigned (will raise a type error at runtime)
const cars = ["Saab", "Volvo", "BMW"];
cars[0] = "Toyota";                         // can change the elements in a const array
const car = {type:"Fiat", model:"500"};
car.color = "red";                          // can change the properties of a const object
