##############
# Decorators #
##############
# Decorators are callables (a function, method or class) that takes a callable as input to modify or enhance its behavior
# They return a new callable that wraps the original, adding behavior before or after it's called
# The original callable is replaced by decorated callable when assigned to the same name
# Decorator syntax of `@decorator_name` followed by callable definition is just syntactic sugar for `original = decorator_name(original) `
from typing import Callable, TypeVar, Any, Type
Function = TypeVar("Function", bound=Callable[..., Any])
Class = TypeVar('Class', bound = Type[Any])


# Function based decorators
# Decorating a function: decorator(function) -> function
def decorator(func: Function) -> Function:          # decorator takes in old function as arg and returns new function
    def wrapper(*args, **kwargs):                   # new function should have the same signature as old function to replace it (so )
        print("Before")
        print(func(*args, **kwargs))
        print("After")
    return wrapper                                  # returns this wrapped function

@decorator                          # applying the decorator to a function (shorthand greet = decorator(greet))
def add(a, b):
    return a + b
add(2,3)                            # This will call the new greet function so output will be "Before\n5\nAfter"


# Decorating a method: decorator(function) -> function
def method_decorator(meth: Function) -> Function:
    def wrapper(self, *args, **kwargs):             # exactly the same as with functions but self has to be added to match signature
        print("Before")
        res = meth(self, *args, **kwargs)           # and so that it can be passed in here
        print("After")
        return res
    return wrapper

class Decorated1:
    @method_decorator
    def say_hello(self):
        print("Hello!")

# Decorating a class: decorator(class) -> class
def fun(cls: Class) -> Class:               # takes in old class as arg and returns new class (T[X] refers to the class for X)
    cls.class_name = cls.__name__                   # can change the class definition like this and use class attributes to do so
    return cls                                      # returns this new class definition so it can replace the old one

@fun
class Decorated2: pass



# Class based decorators
# A decorator can be any callable even a class if the __init__ and __call__ methods are defined
    # __init__: so when `original = decorator_class(original) ` is called the 
    # __call__: so when `original` (which is now a decorator_class instance) is called it will use __call__
# This allows:
    # functions to keep states across multiple calls more cleanly than closures
    # Easier configuration by passing arguments into the constructor
    # More structure with organized helper methods inside the class
class MyDecorator:
    def __init__(self, func):
        self.func = func   # store the function being decorated

    def __call__(self, *args, **kwargs):
        print("Before call")
        result = self.func(*args, **kwargs)
        print("After call")
        return result

@MyDecorator
def greet(name):
    print(f"Hello {name}")

greet("Adham")



# Built in decorators
# Python has several built-in class decorators that modify behavior of methods + attributes, making it easier to manage and use effectively
# Most frequently used ones: @staticmethod, @classmethod and @property
class Decorated3:
    coef = 1         # static / class variable
    
    def __init__(self, name, x):
        self.name = name
        self._x = x
    
    # staticmethod defines a method called on the class itself instead of an instance (classic OOP static methods)
    @staticmethod
    def add(a, b):          # no self required
        return a + b
    
    # classmethod defines a method that takes in it's own class definition and can change it
    @classmethod
    def change_class(cls, value):
        cls.coef += value
        cls.add = staticmethod(lambda a, b: a + b + 1)          # replaces add static method with a new static method (decorators are just functions)
    
    # property defines a method that can access pvt attributes but be accessed like an attribute (classic OOP getter method)
    # Useful when you want to add some extra code whenever ppl access attributes
    @property
    def x(self):
        return self._x

    # Allows setter method for any property/getter methods
    @x.setter
    def x(self, value):
        if value >= 0:
            self._x = value
        else:
            raise ValueError("x cannot be negative")

print(Decorated3.add(Decorated3.coef, Decorated3.coef))
obj = Decorated3('p', 2)
obj.x = 3
print(obj.x)
#obj.x = -1



# Chaining decorators
# You can chain them too which is fairly intuitive
def decor1(func): 
    def inner(): 
        x = func() 
        return x * x 
    return inner 

def decor(func): 
    def inner(): 
        x = func() 
        return 2 * x 
    return inner 

@decor1
@decor
def num():          # decor is applied first then decor1
    return 10

@decor
@decor1
def num2():         # decor1 is applied first then decor
    return 10
  
print(num())        # 400
print(num2())       # 200
