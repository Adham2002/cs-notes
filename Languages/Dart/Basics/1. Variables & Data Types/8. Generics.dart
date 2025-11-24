  //////////////
 // generics //
/////////////
/// Generics are type parameters you can pass to classes and methods
/// They are denoted by <> with a type parameter inside
/// Conventionally we use a single upper case latter like E, T, S, K and V


// Generics classes
abstract class Cache<T, S> {                      // here the class takes in the type parameter T and S
  T getByKey(String key);                         // and uses it to set the type fields
  void setByKey(String key, T value);             // or any variable
}
// You can limit a type parameter to subtype of X by using extends X         
class nonNull<T extends Object> {}                // Any type provided to nonNull for T must be non-nullable (every class is a subtype of object except null)
class Foo<T extends nonNull> {}                   // Any type provided to Foo must be a subtype of 
class subClass extends nonNull {}

var new1 = Foo();                                 // So not specifying a generic argument works
var new2 = Foo<nonNull>();                        // passing the base class specified works
var new3 = Foo<subClass>();                       // passing any subtype of that base class works


// Generic collection
// All collections are classes that take in a type as an argument and use it to set the type of it's elements
// So when we instansiate the class (create a collection) we can pass in a type as an argument
List<String> list1 = ['Seth', 'Kathy', 'Lars'];   // if no type arg given default is dynamic
var list2 = <String>['Seth', 'Kathy', 'Lars'];    // can also pass type like this

Set set1 = <String>{'Seth', 'Kathy', 'Lars'};
var set2 = <String>{'Seth', 'Kathy', 'Lars'};

Map<String, String> map1 = {};
var map2 = <String, String>{
  'index.html': 'Homepage',
  'robots.txt': 'Hints for web robots',
  'humans.txt': 'We are people, not machines'
};


// Generic methods
T first<T>(List<T> ts) {                            // we specify the generic type with first<T> or it can be infered from the:
  print(ts.runtimeType);                            // type of an argument
  T tmp = ts[0];                                    // return type
  return tmp;                                       // once set the type T can be used anywhere it any other type could be
}
