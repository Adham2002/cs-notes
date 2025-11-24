  ////////////
 // Mixins //
////////////
/// Mixins are a way of defining code that can be reused in multiple class hierarchies
/// This also for most of the functionaily of multiple inheritance wihtout a class having 2+ superclasses
/// Mixin cannot have any generative constructors or inherit from a class
/// To allow mixins to invoke methods or access fields that depend constructor parameters they cannot take in we can:
    /// Define abstract methods
    /// Implement an interface
    /// Inherit from another class using the on clause
mixin Mixin1{
  String p1 = 'p1';
  int p2 = 4;
  bool p3 = false;

  void printp1() {print(p1);}

  int abstractMethod();                               // Abstract Methods can be defined in mixins and must be defined by the subclass
  void printp4(){print(abstractMethod());}              // we can now invoke the method defined in the subclass
  String get p4;                                        // we can use abstract getter methods to gain access to instance variables of the subclass
  void printp4Again(){print(p4);}                       // now we can use the field as usual
}


class ClassWithMixin with Mixin1 {                    // use with keyword to use the mixin
  String p1;                                          // any fields or methods can be overriden by the inheriting class as long as the datatype, return type... stays the same
  String p4;
  ClassWithMixin(this.p1, this.p4);
  int abstractMethod(){return p4 as int;}             // abstract class in mixin must be defined
}
 
mixin Mixin2 implements ClassWithMixin{}              // Mixins can implement interfaces



// on clause
// this essentially means the mixin is a subclass of the class in the on clause and can use all it's members
// it also forces any class using the mixin to also be a subclass of class in the on clause
class SuperClass {
  hello() {return 'hello';}
}

mixin Mixin3 on SuperClass {
  helloeHello() {print(super.hello() + 'hello');}
}

class SubClass extends SuperClass with Mixin3 { }         // must extend SuperClass as Mixin3 used on SuperClass



// Mixin classes
// Mixin classes allow you to define a class that is usable as both a regular class and a mixin
// They mus follow the restrictions for both classes and mixin:
    // Mixins can't have extends or with clauses, so neither can a mixin class.
    // Classes can't have an on clause, so neither can a mixin class.
mixin class useAsMixin{}
class ClassWithMixin2 with useAsMixin {}