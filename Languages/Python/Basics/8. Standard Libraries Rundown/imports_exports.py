#######################
# Imports and Exports #
#######################
'''
In python every file is a module whose functions, classes or variables can be imported by other file
'''

# Exports
''' Here are some useful variables and methods that can be imported in another module/file '''
zero = 0

def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

class car():
    pass



# Imports
''' The earlier exports can be imports as shown below '''
import imports_exports
print(imports_exports.zero)
print(imports_exports.add(2,3))
print(imports_exports.car())

from imports_exports import zero                # imports specific parts of the module
import imports_exports as imex                  # changes the name of the module
from imports_exports import zero as z           # or imported part

