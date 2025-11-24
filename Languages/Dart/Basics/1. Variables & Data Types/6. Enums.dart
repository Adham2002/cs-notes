  ///////////
 // Enums //
///////////
/// Enums are a special kind of class used to represent a fixed number of constant values
/// They have a list of instances that must be declared at the beginning of the declaration (at least 1 instance must be declared)
/// All constructors and instance variables must be final or const
/// Enums can implement but not extend another class and cannot override index, hashCode or the equality operator ==
/// every enum has an automatically generated static "values" getter so values cannot be declared in the enum


enum Enum { e1, e2, e3 }            // basic enum



// Enhances enum
// Enhances enums basically defines a class and a list of instances of that class whichare called anum instances
enum Vehicle {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),                      // defining an enum instance
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),                     // these enum instances must go at the beggining and there must be 1+ of them
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0),;                   // end the list of instances with a ;

  const Vehicle({                                                             // this enum instance constructor uses names parameter but this is not needed
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;                                                            // Emun fields that every enum instance must have
  final int passengers;
  final int carbonPerKilometer;

  int tireTimes2(){return tires * 2;}                                         // can have regular methods
  int get carbonFootprint => (carbonPerKilometer / passengers).round();       // including getter methods
  bool get isTwoWheeled => this == Vehicle.bicycle;                           // enum instances are constant and declared at the start so can be used in methods

  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}



// Using enums
void main(){
  print(Enum.e1.name);
  final c = Vehicle.car;                                                      // access the enumerated values like a static variable
  if (c.carbonPerKilometer == 0) print('Carbon neutral');                     // acess fields
  if (c.isTwoWheeled) print('Bicycle');                                       // and methodds as normal
  print(Vehicle.car.name);                                                    // the name of the rnum instance can be accessed like this
  print(c.index);                                                             // each enum instance has an index
  print(Vehicle.values);                                                      // and has a protery that stores the insances in a list

  // switching over enums allows for exhaustive checking
  switch (Vehicle.bus){
    case Vehicle.car: print('car');                                           // if one of the enum instaces wasn't an option an error would appear
    case Vehicle.bus: print('bus');                                           // unless you have a default clause as this catches all options not enumerated
    case Vehicle.bicycle: print('bicycle');
  }
}
