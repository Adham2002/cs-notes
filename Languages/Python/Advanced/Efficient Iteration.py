#######################
# Efficient Iteration #
#######################
'''
Python is written in C under the hood so iterating over array-likes with for loops can be quite slow
Methods like list comprehension and mapping do a better job at moving the computation to the C level
We can see these differences using pythons dis module which supports the analysis of CPython bytecode by disassembling it (bytecode is essentially "assembly" for the python Virtual machine)
We can also test 
'''
import dis
import time
import math

# Mapping
# The map function is very efficient way of iterating and 
arr = ['ab', 'cd', 'ef', 'gh']
arr2 = [1, 2, 3, 4]
def my_fun(x):
    return (x + x[:: -1]).upper()

mapped = map(lambda x: x.upper(), arr)           # returns an iterable object
list(mapped)                                     # have to cast to a list to get values (so nothing is calculated until you use the map)
list(map(list, arr))                             # 
list(map(my_fun, arr))                           # 
list(map(lambda x, y: x * y, arr, arr2))         # 



# Testing efficiency
def a():
    x = []
    for i in range(3000):
        x.append(math.factorial(i))
    return x

def b():
    return [math.factorial(i) for i in range(3000)]


start = time.time()
b()
a_time = time.time() - start


start = time.time()
b()
b_time = time.time() - start

print(f'Method \'a\' took {a_time} to complete')
print(f'Method \'b\' took {b_time} to complete')
# print(f'Method \'b\' took {b_time} to complete.\nHere is the CPython bytecode: {dis.dis(b)}')
