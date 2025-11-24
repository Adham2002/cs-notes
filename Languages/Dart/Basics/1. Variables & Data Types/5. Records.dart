  /////////////
 // Records //
/////////////
/// Attributes (similar to tuple in python)
/// Ordered - items have a defined unchanging order
/// Immutable - the values of elements cannot change and more items cannot be added
/// Typed - every element in a record has a fixed type created when the record is declared
/// Hetrogeneous - can contain fields of different types
/// Anonymous - unlike classes record prototypes don't have names


// Creating records
void creating_Records(){
  final r1 = (10.0, 20.0);                                      // can be initialised with values (types infered)
  final r2 = (lat: 10.0, lon: 20.0, 'last');                    // can have named field
  (double, double) r3;                                          // can specify the field types in declaration
  r3 = (10.0, 20.0);                                            // and then initialise it later
  (double lat, int, double lon) r4 = (10.0, 7, 20.0);           // can name positional fields in declaration (purely for documentation and do not affect record type)
  (String, {int a, bool? b}) r5 = ("b", a: 123, b: true);        // can have named fields that are part of the records type definition/shape
}


// Accessing fields
void accessing_Fields(){
  final r2 = (lat: 10.0, lon: 20.0, 'last');
  final lat1 = r2.$1;                             // returns the first non named field whihc is 'last'
  final lat2 = r2.lat;                            // can access names field like this
}


// Record types
// Records types are not declared but instead determined by the record's unique shape that is converted to a hascode
// Record shape - set of fields, their types and names if any
void record_Types(){
  (num, Object) pair = (42, 'a');       // so the Type of this record is (num, Object)
  var first = pair.$1;                  // Static type `num`, runtime type `int`.
  var second = pair.$2;                 // Static type `Object`, runtime type `String`.
}


// Record equality
// Records types are not declared but instead determined by the record's unique shape
// Record shape - set of fields, field types and any field names in {}
void record_Equality(){
  (int x, int y, int z) point = (1, 2, 3);                // these 2 are the same as their shapes and values are equal
  (int r, int g, int b) color = (1, 2, 3);                // the named fields are not in {} so are not part of the recod's type

  ({int x, int y, int z}) point2 = (x: 1, y: 2, z: 3);    // these 2 are not the same as their shapes are different
  ({int r, int g, int b}) color2 = (r: 1, g: 2, b: 3);    // the named fields are in {} so are part of the record's type
}


// Multiple retruns
// Records allow functions to return multiple values bundles together
// To retrieve record values from a return, destructure the values into local variables using pattern matching.
(String name, int age) multiple_Returns(Map<String, dynamic> json) {                // put the record type as the return type
  return (json['name'] as String, json['age'] as int);                              // return a record of that type being sure that the field types match up
}

({String name, int age}) multiple_named_Returns(Map<String, dynamic> json) {        // to include named fields in the record type put them in {}
  return (name: json['name'], age: json['age']);                                    // and then set the named fields as such
}

void Destructuring(){
  final json = <String, dynamic>{'name': 'Dash', 'age': 10, 'color': 'blue'};
  var (name, age) = multiple_Returns(json);                                         // records can be retrieved into separate variables through detructuring
  var name_age = multiple_Returns(json);                                            // can also be retrieved as a single record
}