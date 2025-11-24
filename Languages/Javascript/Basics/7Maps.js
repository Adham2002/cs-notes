  //////////
 // Maps //
//////////
/*
A Map holds key-value pairs where the keys can be any datatype
A Map remembers the original insertion order of the keys
*/


// Creating Sets
const m = new Map([2, "rge"]);	            // creates a new set object



// Adding elements
m.set("apples", 500);	     // set a map value
let b = "b";
s.add(b);        // can add variables


// Accessing Sets
m.set("apples", 600);       // sets value for "apples" key to 600
m.get("apples");            // gets value of "apples" key
m.forEach (function(value, key) { console.log(value, key);});        // iterates over map elements
s.entries();	                                                 // returns an iterator with the [key,value] pairs
s.values();	                                                     // returns an iterator of the values
s.keys();	                                                     // returns an iterator of the keys


// Deleteing elements
m.delete("apples");	    // Removes an element from the Map
s.clear();              // Removes all elements from the Map


// Map Operations
const inventory = [
    { name: 'asparagus', type: 'vegetables', quantity: 9 },
    { name: 'bananas', type: 'fruit', quantity: 5 },
    { name: 'goat', type: 'meat', quantity: 23 },
    { name: 'cherries', type: 'fruit', quantity: 12 },
    { name: 'fish', type: 'meat', quantity: 22 },
  ];
  
  const restock = { restock: true };
  const sufficient = { restock: false };
  const result = Map.groupBy(inventory, ({ quantity }) => quantity < 6 ? restock : sufficient);             // creates a map 2 keys: the restock var and the sufficient var
  console.log(result.get(restock));                                                                         // inventory elements with quantity <6 become part the restock key's value array 
  // [{ name: "bananas", type: "fruit", quantity: 5 }]
  



// Other Operations
s.has(2);	 // Returns true if a key exists in the map
m.size;	     // Returns the number of elements