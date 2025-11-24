##############
# Data Types #
##############
from typing import Any
import random
'''
Python is a first class OOP language so everything is an objects including functions
'''


''' Strings '''
x: Any = "Hello World"                                       # str



''' Numeric Types '''
x = 20                                                  # int
x = 20.99                                               # float
x = float("-inf")                                       # also float
x = 35e3                                                # = 35000.0
x = 3+1j                                                # complex

# the above are automatically cast as there data type but can be cast as others
print(float(20))                                        # = 20.0
print(int(20.99))                                       # = 20 (rounds down)
print(complex(20.99))                                   # = 20.99+0j

# for random numbers
print(random.randint(1, 10))                            # int between 1 and 10
print(random.random())                                  # float between 0 and 1
print(random.uniform(5,9))                              # float between 5 and 9



''' Arrays '''
x = ["apple", "banana", "cherry"]                       # list
x = ("apple", "banana", "cherry")                       # tuple
x = range(6)	                                        # range



''' HashMaps '''
x = {"name" : "John", "age" : 36}                       # dict



''' Sets '''
x = {"apple", "banana", "cherry"}	                    # set
x = frozenset({"apple", "banana", "cherry"})	        # frozenset



''' Booleans '''
x = True	                                            # bool
y = False



''' Binary Types '''
x = b"Hello"	                                        # bytes
x = bytearray(5)	                                    # creates an bytearray of 5 0s in byte form
x = bytearray([254, 2, 78])                             # converts array into a bytearray
x = memoryview(bytes(5))	                            # memoryview



''' None Type '''
x = None	                                            # NoneType
