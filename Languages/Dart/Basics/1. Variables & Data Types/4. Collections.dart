  /////////////////
 // Collections //
/////////////////

// Collection types
List list = [];
Map map = {};
Set set = {};
// see records.dart for info on records

// Common collection methods
void commonCollectionMethods(){
  print(list.isEmpty);
  print(set.isNotEmpty);
  print(map.length);
  print(set.first);       // sets have first and last properties but Maps do not
  print(list.last);

  list.forEach((x) => print(x));
  set.forEach((x) => print(x));
  map.forEach((k, v) => print(v));

  var newList = list.map((x) => x.toUpperCase()).toList();      // returns Iterable type so is lazily evaluated (use .toList to call function immediately)
  var newMap = map.map((k,v) => v.toUpperCase());               // returns a Map so NOT lazily evaluated
  var newSet = set.map((x) => x.toUpperCase()).toSet();         // also returns Iterable type s(use .toSet to call function immediately)

  var ListUnder10 = list.where((x)=> x < 10);                   // returns an Iterable with all elements from list that are less than 10
  var mapUnder10 = map.removeWhere((k,v)=> v > 10);             // maps doesn't have where but does have a removeWhere method
  print(list.any((x)=> x < 10));                                // returns true is any element is less than 10
  print(list.every((x)=> x < 10));                              // return true is every element is less than 10
}



// Lists (similar to lists in python)
void lists(){
  // Creating lists
  var l1 = <String>[];
  var l2 = [1, 2, 3];                       // is List<dynamic> by default
  var l3 = List.filled(99, 'element');
  var l4 = List<int>.from(l2);              // for casting element to subtype of current element type
  var l5 = List<num>.of(l4);                // for casting element to supertype of current element type

  // Accessing elements
  print(l1[0]);
  print(l1.indexOf('kiwi'));
  print(l1.sublist(2,4));

  // Adding elements
  l1.add('kiwis');
  l1.addAll(['grapes', 'bananas']);

  // Removing elements
  l1.remove("s");
  l1.removeAt(0);
  l1.removeLast();
  l1.removeRange(0, 2);
  l1.removeWhere((x)=> x=="s");
  l1.clear();

  // Rearanging lists
  l1.sort((s1, s2) => s1.compareTo(s2));                    // sort takes in a functioin that takes 2 arguments and returns:
                                                            // a negative if s1 is ordered before s2,
                                                            // a positive value is s2 is ordered before s1
                                                            // and 0 is they are ordered the same (compareTo does this alphabetically for strings)
  Iterable<String> rev = l1.reversed.toList();              // returns Iterable type so is lazily evaluated (use .toList to call function immediately) 
}



// Sets (similar to sets in python but is ordered)
void sets(){
  // Create an empty set of strings.
  var s1 = <String>{};
  var s2 = Set<String>();
  var s3 = Set.from([79, 22, 54]);

  // Add new items to it.
  s1.add('gold');
  s1.addAll(['gold', 'titanium', 'xenon']);

  // Remove an item from a set.
  s1.remove('gold');
  s1.removeAll({'gold', 'xenon'});

  // Accessing elements
  print(s1.contains('titanium'));                    // check whether an item is in the set
  print(s1.containsAll(['titanium', 'xenon']));      // check whether all the items are in the set
  print(s1.elementAt(2));                            // prints elment at index 2 which is xenon

  // Set operations
  print(s1.union(s2));
  print(s1.intersection(s2));
  
}



// Maps (similar to dicts in python)
void maps(){
  // creating maps
  Map m1 = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu'],
    4 : 5
  };
  Map m2 = Map();                                  // maps can be built from a constructor
  Map m3 = Map<int, String>();                     // can specify what types the key and value should be

  // Accessing elements
  print(m1.containsKey('Oahu'));
  print(m1['Oahu']);
  print(m1.containsKey(4));
  var keys = m1.keys;
  var values = m1.values;

  // Adding elements
  m1['new'] = 3;
  m1.putIfAbsent('new', () => 3);         // adds a new entry at 'new' if there isn't already one
  m1.addAll(map);

  // Removing elements
  m1.remove(4);
  m1.clear();
}
