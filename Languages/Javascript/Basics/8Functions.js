  ///////////////
 // Functions //
///////////////
/// Javascript has a lexical scope so functions are scoped
/// Javascript functions always return a value (if void then returns null)
// Functions can be called before they are declared as the entire function declarations (including their body) is hoisted


// Creating Functions
// Arrow functions are not hoisted) and cannot be constructed with the new keyword
// good for changing scope without storing a new function to the global scope
function myFunction(p1, p2) {return p1 * p2;}                       // normal function declaration
const myFunction = new Function("a", "b", "return a * b");          // functions can also be defined with a built-in JavaScript Function() constructor

const x = function (a, b) {return a * b};                           // functions can also be defined using an expression
let z = x(4, 3);                                                    // the function is anonymous (has no name) but can be called using the variable name
const x_shorter = (x, y) => x * y;                                  // arrow functions allows a short syntax for writing function expressions
const shortest = x => x + 1;                                        // () are not needed if there is 1 parameter
const x_short = (x, y) => { return x * y };                         // if function has more than 1 statement, a return keyword and curly brackets are needed

const obj = {
    func :  function outerFunction() {
        const value = 42;
        const innerFunction = () => {                               // function declared within other functions/objects do not have their own:
            console.log(value);                                     // scope so can use variables defined in the outer function
            console.log(this);                                      // 'this' context so takes it from it's cur scope (in this case uses outer function which refers to obj 'this')
            console.log(arguments);                                 // arguments object so this refers to the outer function's argument
        };
    }
}

(function () {                                                     // self envoking function expressions are anonymous
    let x = "Hello!!";                                             // brackets around function to indicate it's a function expression
})();                                                              // expression is envoked automatically if followerd by ()



// Parameters
//function do not:
    // specify data types for parameters
    // perform type checking on the passed arguments
    // check the number of arguments received
// missing values are set to undefined
// Arguments are passed in by value (changing arguments of primative type won't change that parameters passed in)
// But object values are their references so changes to object properties will change the object passed in
function myFunction(x, y = 10) {return x + y;}                  // default parameter values can be set
function sum(...args) {return "not implemented";}               // rest parameter (...) allows a function to treat an indefinite number of arguments as an array
function myFunction(p1, p2) {
    let x = arguments[0]                                        // built in arguments array object is created when function is called
    return x * p2;
}




// All Functions are Objects and Methods
// (with additional ability to be invoked)
// If a function is not a method of a JavaScript object, it is a function of the global object
myFunction.new_prop = "new"                                     // they can have properties
myFunction.new_func = function() {console.log("new");};         // they can have methods
function copy(func) { return func(1, 2); }                      // they can be passed as arguments to functons
// they can be returned from functions



// Call and Apply build-in functions
// These are all ways to invoke methods from 1 object on a different object
const person = {
    fullName: function() {return this.firstName + " " + this.lastName;},
    details: function(city, country) {return this.firstName + " " + this.lastName + "," + city + "," + country;}
}
const person1 = {firstName:"John", lastName: "Doe"}

// call()
person.fullName.call(person1);                                 // fullname method is used on person1 object as if person1 were the parent object (so this keyword uses person1 properties)
person.fullName.call(person1, "Oslo", "Norway");               // call() method can also accept arguments

// apply()
person.fullName.apply(person1, ["Oslo", "Norway"]);            // apply() method works the same except it takes aregument as an array
Math.max.apply(null, [1,2,3]);                                 // applies math.max (which take list of arguments not arrays)
Math.max.apply(Math, [1,2,3]);                                 // in strict mode MATH becomes the owner object of the invoked function as it is not an object (in non-strict mode it is the global object)

// bind()
let fullName = person.fullName.bind(person1);                  // this is a copy of the original fullname method but it's parent object is now person1



//Function Closure
const add = (function () {
    let counter = 0;                                                    // counter variable is initialized but this function is closed (it's self invoking so only runs once)
    return function () {counter += 1; return counter}                   // the value of add is set to this nested function expression which has access to the counter variable
  })();                                                                 // This means counter is a private variable to the add function and is protected by the scope of the anonymous function
  
  add();
  add();
  add();