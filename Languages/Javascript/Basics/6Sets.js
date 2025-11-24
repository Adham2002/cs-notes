  //////////
 // Sets //
//////////

// Creating Sets
const s = new Set([2, "rge"]);	            // creates a new set object



// Adding elements
s.add("a");	     // adds a new element to the Set
let b = "b";
s.add(b);        // can add variables


// Accessing Sets
s.forEach (function(value) { console.log(value);});        // iterates over set elements
s.entries();	                                                 // returns an iterator with the [value,value] pairs insead of [key,value] pair
s.values();	                                                     // returns an iterator of the values
s.keys();	                                                     // Same as values()


// Deleteing elements
s.delete(2);	  // Removes the element 2 from a Set
s.clear();      // Removes all elements from a Set


// Set Operations
s.union(other);                     // returns elements in both s and other
s.intersection(other);              // returns elements that are in both s and other
s.difference(other);                // returns elements in s that are not in other
s.symmetricDifference(other);       // returns elements in s and other that are not in both
s.isDisjointFrom(other);            // returns true is s and other have no elements in common (otherwise false)
s.isSubsetOf(other);                // returns true is s is a subset of other
s.isSupersetOf(other);              // returns true is s is a superset of other



// Other Operations
s.has(2);	 // Returns true if a value exists in set
s.size;	     // Returns the number of elements