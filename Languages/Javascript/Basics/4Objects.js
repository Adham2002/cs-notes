  /////////////
 // Objects //
/////////////
// All JavaScript values, except primitives, are objects
// similar to dictionaries in Python

// Creating Objects
const p = {firstName:"John", lastName:"Doe"};                                             // creates a single object, using an object literal
const p2 = new Object();                                                                  // creates a single object, with the keyword new.
function p_constructor(name, age) {this.name = name;}                                     // defines an object constructor
const p3 = new p_constructor('John', 30);                                                 // create objects of the constructed type (new keyword creates an object)
const p4 = Object.create(p);                                                              // creates an object that has the properties and methods of a prototype object
const p4_empty = Object.create(null);                                                     // creates an object that has no properties or methods (not even build in ones like toString or __proto__)
const p5 = {                                                                              // nested object
  firstName:"John", 
  lastName:"Doe",
  DOB: 2000, 
  Adress: {
    street: "123 Main St.",
    city: 'Houston',
  }
}

// Properties
const person = {                    // best practice to define as a constant
    firstName: "John",              // properties are defines a name:value pair
    lastName: "Doe",
};
person.firstName;                                     // accesses firstName property
person["firstName"];                                  // does same as above
let newp = [...p];                                    // spread operator (...) spreads an iterable into it's elements
Object.keys(person);
Object.getOwnPropertyNames(person)                    // Returns all keys as an array
Object.keys(person)                                   // Returns enumerable keys as an array
Object.values(person);                                // Returns enumerable values as an array
name2(p5)                                             // Destructuring an object is when your code only takes the properties it needs
function name2({lastName, firstName}){}               // properties don't have to be listed in order unlike array destructing
myVehicle(vehicleOne)
function myVehicle({ firstName, Adress: {city} }) {}  // Destructuring a nested object


// property attributes
let attributes = Object.getOwnPropertyDescriptor(person, "firstName")         // returns this object describing the attributes of firstName {value: 'John', writable: true, enumerable: true, configurable: true}
attributes.writable                                                           // writable     = true: value of the property is changeable
attributes.enumerable                                                         // enumerable   = true: proterty is accessable when object properties are iterated on
attributes.configurable                                                       // configurable = true: property can be deleted and it's attributes are cannot be changed
Object.defineProperty(person, firstName, {writable: false})                   // changing property attributes

// adding new properties
person.eyeColor = "blue";
person["eyeColor"] = "blue";
Object.defineProperty(person, "eyeColour", {value: "Blue", writable: false})      // create a new property and define it's attributes
Object.defineProperties(person, {                                                 // create multiple properties defining each of each of the properties
  property1: {value: 42, enumerable: false, configurable: false},
  property2: {}
});
const myUpdatedVehicle = {...p, ...p2}                                            // combines the properties of p and p2 (propeties with same keys are overwriiten by last object passed)

// removing properties
delete person.lastName;            // deletes both the value of the property and the property itself
delete person["lastName"];         // delete operator designed for object properties (no effect on variables or function and may crash app if used on predefined JS object properties)

// itereating over properties
for (let x in person) {txt += person[x];}     // iterates over keys of an object


/*
Methods
*/
const person2 = {
    firstName: "John",
    lastName : "Doe",
    id       : 5566,
    fullName : function() {return this.firstName + " " + this.lastName;}        // methods are stores in properties with function definitions
};


/*
Prototypes
The prototype property of a constructor function is used to define properties and methods that will be inherited by instances created from that constructor
We can add properties and methods to this prototype that we can't add to the constructor function
*/
p_constructor.prototype.nationality = "English";
p_constructor.prototype.name = function() {return this.firstName + " " + this.lastName;};
Object.getPrototypeOf(obj);                                                                 // returns  "Object { counter: 0 }"


/*
Accessors
*/
const person = {
  firstName: "John",
  lastName: "Doe",
  language: "en",
  get lang() {return this.language.toUpperCase();},                           // accessed through peron.lang      (getters cannot take arguments)
  set lang(lang) {this.language = lang.toUpperCase();},                       // set though person.lang = "new"   (setter can take arguments)
  get fullName() {return this.firstName + " " + this.lastName;}               // accessed through person.fullName (like a property instead of a method)
};

// adding Getters and Setters
const obj = {counter : 0};
// Define setters and getters
Object.defineProperty(obj, "reset", {get: function() {this.counter = 0;}});
Object.defineProperty(obj, "increment", {get : function () {this.counter++;}});
Object.defineProperty(obj, "decrement", {get : function () {this.counter--;}});
Object.defineProperty(obj, "add", {set : function (value) {this.counter += value;}});
Object.defineProperty(obj, "subtract", {set : function (value) {this.counter -= value;}});

obj.reset;
obj.increment;
obj.decrement;
obj.add = 5;
obj.subtract = 1;


/*
Protecting Objects
*/
Object.preventExtensions(object)      // Prevents adding properties to an object
Object.isExtensible(object)           // Returns true if properties can be added to an object

Object.seal(object)                   // Prevents changes of object properties (not values)
Object.isSealed(object)               // Returns true if object is sealed

Object.freeze(object)                 // Prevents any changes to an object
Object.isFrozen(object)               // Returns true if object is frozen


/*
Display
*/
person;                                                // outputs [object Object]
person.firstName + "," + person.lastName;              // outputs John,Doe
let txt = "";
for (let x in person) {txt += person[x] + " ";};       // outputs John Doe
Object.values(person);                                 // outputs John,Doe
JSON.stringify(person);                                // outputs {"firstName":"John","lastName","Doe"}
console.log(person);                                   // outputs {"firstName":"John","lastName","Doe"} to console log


/*
New keyword (AVOID)
*/
// when a JavaScript variable is declared with the keyword "new", the variable is created as an object:
x = new String();        // String object
y = new Number();        // Number object
z = new Boolean();       // Boolean object