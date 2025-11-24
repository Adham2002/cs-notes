  //////////////////////
 // Class  Modifiers //
//////////////////////
/// Class modifiers control how a class or mixin can be used, both from within its own library, and from outside the library where it's defined
/// They come before a class or mixin declaration (only base can come before a mxin)



// Interface
// Every class implicitly defines an interface containing all the instance members of the class (and of any interfaces it implements)
// Implements - any other class that implements this class' interface must implement each interface member with the same signiture
// Using the actual interface keyword will mean the class can't be extended only implemented (can't be a superclass only and interface)
interface class Person {
  final String _name;                                         // all properties even private ones are in the interface (but visible only in this library)
  Person(this._name);                                         // constructor are In the interface
  String greet(String who) => 'Hello, $who. I am $_name.';    // and so are methods
}

interface class Impostor implements Person {
  String get _name => '';                                             // Imposter implements Person so musty implement it's members like _name as a String
  String greet(String who2) => 'Hi $who2. Do you know who I am?';     // and the greet method which must return and take a String as a parameter (names can be different unless it is a names parameter)
  int? newMember;
}

class Impostor2 implements Person, Impostor{                    // A class can implement multiple interfaces and has to implement all members from both classes 
  String _name = '';                                            // If 2 interfaces have the same member it only has to be implemented once)
  String greet(String who) => 'Hi $who';                        // If 2 interfaces have member with the same name but different signitures you cannot implement both
  int? newMember;
}



// Abstract
// Absracts classes are meant to be extended so there subclasses can implement their functionality
// They can't be instansiated and it's constructors and methods can be abstract
// Abstract methods have no body but must be implements in subclasses of the abstract class
abstract class abstractClass{     // must be defined in abstract classes
  int p1;
  abstractClass(this.p1);                             // abstract constrtuctor
  void doSomething();                                 // leaves implementation up to other classes
  void doSomething2() => print('something2');         // not all methods have to be abstract
  factory abstractClass.fact(p1){return p1;}          // can still have a factory constructor
}

class inheritsSubclass extends abstractClass{
  inheritsSubclass(super.p1);
  void doSomething() => print('something');
}



// Base
// Base classes cannot be implementated outside of its own library so that:
    // The base class constructor is called whenever a subclass is instansiated
    // All implemented private members exist in subtypes (private member are only private to a library)
    // Adding a new member to the base class does not break subtypes, as all subtypes inherit the new member (unless the subtype already declares a member with the same name and an incompatible signature)
base class baseClass {}



// Final
// final classes cannot be implemented or extended outside of their libabry
// for libabry creator this means that methods can't be overriten by third parties
final class finalClass {}



// Sealed
// Sealed classes cannot be extended or implemented outside their own libabry and are implicitly abstract
// This means that all there subclasses will be this the same library so can all be easily found allowing for exhaustiveness checking when switching over subclasses
// Exhaustive checking - a compile-time error is thrown if it's possible for a value to not match any switch cases
sealed class Shape {}

class Square implements Shape {
  final double length;
  Square(this.length);
}

class Circle implements Shape {
  final double radius;
  Circle(this.radius);
}

double calculateArea(Shape shape) => switch (shape) {         // since the value being matches is sealed type we must exhautively check every option
    Square(length: var l) => l * l,
    Circle(radius: var r) => 3.14159 * r * r                  // if both of these were not here the static analyser would raise an error
};



// Mixin
// See mixin classes in Mixins.dart file