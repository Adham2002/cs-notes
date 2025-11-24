###########
# Classes #
###########
# Python is a multi-paradigm language; classes enable its object-oriented side
# Every value—including functions and modules—is an object whose type is a class
# All new-style classes (any class defined in Python 3) implicitly inherit from the
# built-in base class `object`, giving them a common root and features like `__str__`
# TODO: condense below comments
# Multiple inheritance is allowed: a class can list several parent classes in
# its definition header, e.g. `class C(A, B): ...`
#   • The method-resolution order (MRO) is computed with C3 linearisation, which
#     determines the order in which base classes are searched for attributes
#
# Interfaces are not a built-in language feature, but:
#   • The `abc` module lets you declare *abstract base classes* (ABCs) that define
#     abstract methods and properties which concrete subclasses must implement
#   • PEP 544 *Protocols* (from `typing` / `typing_extensions`) provide a way to
#     specify *structural* (duck-typed) interfaces for static type checkers
#
# Mixins are ordinary classes intended to be combined via multiple inheritance;
# they usually:
#   • inherit from `object` (or an ABC) rather than another concrete class
#   • supply a small, orthogonal chunk of behaviour
#   • rely on the owner class (or other mixins) to provide certain attributes
#
# Attributes, methods, and even nested classes can be declared anywhere in the
# class body; they are executed at class definition time and become class
# attributes.  Common idioms:
#   • “instance variables” are typically first introduced in `__init__(self, …)`
#   • “class variables” are defined directly in the class body
#
# Constructors:
#   • `__new__(cls, …)`  → builds a new instance (rarely overridden)
#   • `__init__(self, …)` → initialises the instance and may raise exceptions
#
# Special methods like `__str__`, `__len__`, arithmetic dunders, etc. let your
# objects integrate with Python’s syntax and standard library
#
# Access control is by convention:
#   • a leading underscore _var signals “internal use”
#   • double-underscore __var triggers name-mangling, not true privacy
#
# Data descriptors (`property`, `@dataclass`, `slots`, etc.) provide concise,
# declarative ways to manage attribute storage and validation
from dataclasses import dataclass, field
from pathlib import Path


''' creating a class '''
class Class:
    static_atr1 = ''        # can define static attributes by setting their value
    static_atr2: int        # or by giving it a type hint
    
    def __init__(self, name):
        self.name = name        # variables and methods are public by default
        self._protected = 1     # protected variables/methods are accessable within the class and all subclasses                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        self.__private = 1      # private variables/methods are accessable only within the class

    def greet(self):
        print(f"Hello, {self.name}!")


# dataclass decorator inspects annotated fields (class variable with type annotations) and generates __init__ function setting every self.var = var
@dataclass
class Job:
    title: str
    salary: int
    remote: bool = False                         # auto‑assigned
    pay_band: str = field(init=False)            # will be a input param but won't be set by the decorator

    # extra computation or validation
    def __post_init__(self):
        if self.salary < 40000:
            self.pay_band = "B1"
        else:
            self.pay_band = "C1"


''' subclasses '''
# subclass inherits all methods and variables from parent class
class Subclass(Class):
    # Calling the parent class constructor
    def __init__(self, name, age):
        super().__init__(name)  
        self.age = age

    def greet(self):
        # Calling the greet method of the parent class
        super().greet()
        print(f"You are {self.age} years old!")

child = Subclass("Alice", 10)
child.greet()


''' properties '''
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    
    @property
    def shape(self):
        return self._shape
    
    @property
    def colour(self):
        return self._colour


    ''' Overriding functions '''
    def __add__(self, other):
        return Point(self.x + other.x, self.y + other.y)

    def __sub__(self, other):
        return Point(self.x - other.x, self.y - other.y)

# Create two Point objects
p1 = Point(1, 2)
p2 = Point(3, 4)

# Use the + operator to add points
result_add = p1 + p2
print(result_add)  # Output: (4, 6)

# Use the - operator to subtract points
result_sub = p2 - p1
print(result_sub)

class GameObject():
    def __init__(self, shape, colour):
        self._shape = shape
        self._colour = colour
    
    def __eq__(self, x):
        if type(x) != GameObject:
            return False
        return self.shape == x.shape and self.colour == x.colour

    def __repr__(self):
        return str(f"<{self._shape}, {self._colour}>")

'''
fff
'''