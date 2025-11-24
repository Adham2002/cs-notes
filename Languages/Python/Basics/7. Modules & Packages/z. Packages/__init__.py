############
# Packages #
############
'''
A package is a way of organizing related modules (Python files) into a directory structure making it easier to manage and distribute code, especially for larger projects
A package is a directory that contains a collection of Python modules and an __init__.py file (package name = directory name)
A Package groups all the modules within the directory into the same namespace
There are 3 types of packages:
    - Standard library packages come with python and thus can be inported without installing any extra files are writing any code e.g. math, os or datetime
    - 3rd party are from the Python Package Index (PyPI) and must be installed before they can be imported e.g. numpy, pandas and requests
    - User defined are custom packages you can create to organise your code
'''


''' Importing Packages '''
import math                                             # standart library packages don't require installs to import
import numpy                                            # 3rd party packages require an install usually through 'pip install package_name'
import subpackage                                       # user defined packages require the user to create them as shown in the subpackage folder in this directory
#print(subpackage.submodule1.a)

import subpackage.submodule1 as ss                      # imports only 1 module from the package
print(ss.a)

from subpackage.submodule1 import a as value            # imports a variable, method or class from the module
print(value)
