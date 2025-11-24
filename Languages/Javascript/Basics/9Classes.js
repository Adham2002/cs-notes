  /////////////
 // Classes //
/////////////
// very much like Python classes
// Classes are not object but rather templates for objects
// Classes are not hoisted

/*
Creating Classes
*/
class Car {
    constructor(name, year) {                           // same as init in Python
      this.name = name;
      this.year = year;
      this.brand = brand;
    }

    age() {
        const date = new Date();
        return date.getFullYear() - this.year;
      }
}

const myCar = new Car("Ford", 2014);


/*
Inheritance
*/
class Model extends Car {
    constructor(name, year, brand, mod) {
      super(name, year, brand);                       // super calls the constructor of the superclass (parent)
      this.model = mod;
    }
    show() {
      return "The car is " + this.age() + 'years old and it is a ' + this.model;
    }
}


/*
Private Properties and Methods
*/
class Car {
    #carname;                                            // declaring private propeties 
    constructor(brand) {
      this.#carname = brand;
    }
    show(){return this.#carname;}                        // using 
}


/*
Accessors
*/
class Car {
    constructor(brand) {
      this._carname = brand;
    }
    get carname() {                                    // getters and setters work the same as in objects
      return this._carname;
    }
    set carname(x) {                                   // getter and setters cannot be the same name as properties
      this._carname = x;
    }
}


/*
Static Methods
*/

class Car {
    constructor(name) {
      this.name = name;
    }
    static hello(x) {                               // static methods cannot be called on an object only on a class
      return "Hello " + x.name;
    }
  }
  const myCar2 = new Car("Ford");
Car.hello(myCar2);                                  // If you want to use the an object inside the static method you can send it as a parameter