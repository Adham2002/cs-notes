  ////////////
 // Arrays //
////////////
// arrays are objects that are indexed via number rather than strings
// if you try to access an array using a named insex it will convert the array to an object

// Creating Arrays
const arr = [2, "rge"];	                            // creates a new array object
const arr2 = new Array(2, "rge");                   // alternative way (mostly used to cast other datatypes as an array)
const arr3 = new Array(40);                         // creates an array with 40 undefined elements
const arr4 = Array.of(40)                           // creates an array with 1 element
Array.from("ABCDEFG")	                              // Creates an array from any iterable object
const arr5 = [1, 2, [3, [4, 5, 6], 7], 8];          // create an array with multiple dimensions



// Adding elements
arr.push("a");                            // adds "a" new element to the array, and returns the new length
arr[arr.length] = "a";	                  // does the same thing but using high indexes can cause undefined holes in the array
arr.unshift("a")	                        // adds "a" to the beginning of an array, and returns the new length
arr.splice(2, 0, "a", "c")                // adds "a" and "c" at index 2 (and removes 0 elements)
let newp = [...arr];                      // spread operator (...) spreads an iterable into it's elements


// Accessing arrays
arr[0] = 3;	                                                 // indexed the same as every other language
arr.at(-1);                                                  // same as above but supports negative indexing
const entries = arr.entries();	                             // returns an array of key(index)/value pairs [0, 2], [1, "rge"], ...
const keys = arr.keys();	                                   // Returns a Array Iteration Object, containing the keys of the original array
arr.forEach (function(value) { console.log(value);});        // takes a function (which only has 1 argument. value) as an argument and iterates over array elements applying the function
const [a, , c] = arr5;                                       // takes only the needed elements form an array (destructuring)
const [d, e, ...rest] = arr5;                                // rest operator condenses the array elements into an array (opposite to spread but similar syntax)


// Deleteing elements
arr.clear();                  // removes all elements from arr
let last = arr.pop()	      // removes the last element and returns that element
let first = arr.shift()	      // removes the first element and returns that element
arr.splice(0, 2);             // removes first 2 elements


// Finding Elements
let find = arr.find(func);	                     // returns first element in an array that where func(element)=true (returns undefined in no element found)
let fIndex = arr.findIndex(func);     	         // same as find but returns the index
let fLast = arr.findLast(func);	                 // same as find but finds the last instance in the array
let fLast_index = arr.findLastIndex(func);	     // same as findLast but returns the index
arr.includes("Mango");	                         // returns true if "Mango" is in arr
arr.includes("Mango", 3);                        // starts search at index 3
let fIndex2 = arr.indexOf("rge");                // returns fist index of "rge" in arr (returns -1 if not found)
let fIndex3 = arr.indexOf("rge", 3);             // starts search at index 3
let fIndex4 = arr.lastIndexOf("rge")	           // same as indexOf but finds the last instance in the array


// Changing Values & Order of Elements
arr.copyWithin(2, 0);	                                            // copies all elements from index 0 and puts it at index 2
arr.copyWithin(2, 0, 3);                                          // copies all elements from indexs 0 - 3 and puts it at index 2 - 5
arr3.fill(0);	                                                    // fills the elements in an arr3 with 0 (argument must be static value)
fruits.fill("Kiwi", 2, 4);                                        // fills indexes 2 and 3 with "kiwi"
const fill = arr.filter(func);	                                  // creates a new array with every element in arr that returns true for func(element) (doesn't execute function for empty elments)
const flattened = arr5.flat(2);	                                  // concatenates sub-array elements up to a depth of 2 (default depth is 1)
arr.reverse();	                                                  // reverses the order of the elements in an array
arr.sort();                                                       // sorts the elements as strings in alphabetical ascending order
arr.sort(function(a, b){return b-a})();	                          // sorts the elements in ascending numerical order


// Creating New Variable from Arrays
const new_arr = arr.with(-1, "replaced")	                                                         // Returns a new array with the last value changed (copy not a pointer)
const new1 = arr.concat(arr2, arr3);	                                                             // returns an array with the joined arrays
const combined = [...arr2, ...arr3];                                                               // same as above but works with >2 arrays (spread operators)
const new2 = arr.slice(-3,-1)	                                                                         // returns the last 3 elements as an array
const mappedArr = arr.map(function(currentValue, index, arr){}, thisValue)	                     // creates a new array with the result of calling a function for each array element (index, arr and thisValue are optional)
const flatMappedArr = arr.flatMap(function(currentValue, index, arr){}, thisValue)	               // same as map but flattens array 
let reduced = arr.reduce(function(total, currentValue, currentIndex, arr){}, initialValue)	       // reduces the values of an array to a single value (going left-to-right)
let reduced2 = arr.reduceRight(function(total, currentValue, currentIndex, arr){}, initialValue)	 // reduces the values of an array to a single value (going right-to-left)


// Array Proterties
arr.constructor;	                                // Returns the function that created the Array object's prototype ("function Array() { [native code] }" for javascript arrays)
arr.length;	                                      // Returns the number of elements
Array.prototype.myUcase = function() {            // prototype property allows you to add new properties and methods to arrays.
    for (let i = 0; i < this.length; i++) {
      this[i] = this[i].toUpperCase();
    }
  };
var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits.myUcase();


// Array Checks
Array.isArray(arr)              // returns true if arr is an array
arr instanceof Array;           // does same thing
arr.every(func);	              // returns true if every element in arr returns true for func(element) (doesn't execute function for empty elments)
arr.some(func)	                // returns true if any element in arr returns true for func(element)


// Display arrays
arr.toString();	                // returns array as a string
let text = arr.join(" and ");   // returns array as a string with a separator is specified