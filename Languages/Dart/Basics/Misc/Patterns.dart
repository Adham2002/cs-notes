  //////////////
 // Patterns //
//////////////
/// A pattern represents the shape of a set of values and are used to match or destructure objects
/// Matching - checking whether a pattern and a object have the same value and shape
/// Destructuring - convenient syntax for break objects down into their constituent parts and save them in variables
/// Patterns can be used in:
    /// Local variable declarations and assignments
    /// for and for-in loops
    /// if-case and switch-case
    /// Control flow in collection literals

// Variables
final number = 6;
final record = (1, [2, 'str']);
final list = [6, 'a'];
List<List<int>> nested_list = [[2, 4], [5]];
final map = {'key1': {'subkey1': 'value1'}, 'key2': 'value2'};
Object obj = {};
String? n = "hey";
(int?, int?) nullNums = (2, 3);

class Point {
  final int x, y;
  Point(this.x, this.y);
}

class Rectangle {
  final Point topLeft, bottomRight;
  Rectangle(this.topLeft, this.bottomRight);
}

var rect = Rectangle(Point(0, 0), Point(5, 5));



// Pattern types
void pattern_Types(){

  switch (number) {case 1:print('one');}                                      // CONSTANT patterns check if an object matches a value e.g. does number==1
  switch (number) {case var v:print('int');}                                  // VARIABLE patterns check if an object matches a declared variables type and binds it to that local variables if so
  if (number is double) {print(number);}                                      // CAST pattern locally casts an object to a certain data type if possible
  switch (nested_list) {case List<List<int>> a :print('int');}                // Cast patterns with 
  switch (number) {case _:print('anything');}                                 // WILDCARD pattern matches to any value but doesn't bind
  if (number >= 6) {print('>=6');}                                            // RELATIONAL used 
  switch (n) {case var s?:print('one');}                                      // NULL CHECK pattern safely checks if object is non-null (local variable will be non-null)
  switch (n) {case var s!:print('one');}                                      // NULL ASSET pattern throws a runtime error if the object is null (local variable will be non-null)
  var (x!, y!) = nullNums;                                                    // can use null asset to eliminate nullable from variables when assigning

  
  // Subpatterns
  void subpatternTypes(){
    /// Subpatterns are nested within other patterns to match and destructure nested data
    /// Patterns match recursively on their subpatterns so you can have a pattern within a pattern withn a...
    switch (list) {case [int a, String b] :print('done');}                                // LIST patterns recurvively match subpatterns to the list elements
    var [a, b, ..., c, d] = [1, 2, 3, 4, 5, 6, 7];                                        // List patterns can contain one rest element
    var [e, f, ...[t, ...], g, h] = [1, 2, 3, 4, 5, 6, 7];                                  // can also use a subpattern to match the unmatches elements
    switch (map) {case {'key1': {'subkey1': var value1}} :print('done');}                 // MAP patterns recurvively match subpatterns to map values of specified keys
    switch (number) {case 6||4 :print('6 or 4');}                                         // LOGICAL patterns allow for matching multiple patterns as long as the same variable is used in any subpatterns
    switch (record) {case (int a, [int b, String c]) :print('done');}                     // RECORD patterns recurvively match subpatterns to the record elements
    switch (obj) {case Rectangle(bottomRight: var p,                                      // OBJECT patterns recurvively match subpatterns to object fields
                                 topLeft: Point( x:var h, :var y)) :print('done');}       // Named fields in records or objects can use (name: newVar) or (:name) to create new local variables
  }
}


// Pattern uses
void pattern_Uses(){
  var (a, [b, c]) = record;                                           // variable declaration for destructuring       (dart infers lists as list<Object> so b won't be an int)
  (b, a) = (a, b as int);                                             // variable assignmen for destructuring         (therefore we have to cast b as an int)
  switch (number) {case 1:print('one');}                              // switch satements for matching and destructuring
  if (number is double) {print(number);}                              // if statements for matching and destructuring
  for (var MapEntry(:key, value: count) in map.entries) {}            // for loops
}



