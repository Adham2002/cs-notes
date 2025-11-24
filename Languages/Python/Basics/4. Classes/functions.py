#############
# functions #
#############
# 


# Function basics
def func(num):     # create func using def keyword and any number of parameters
    #pass                 # pass would allow func to have no body
    print(num)            # func can print
    return num            # funcs can return values (None returned if no return specified)

func(1)           # calling a function
n = func(1)       # can assign reult of function call (value returned) to a variable



# Parameter and Arguments
# Parameters define was variables a function will take in e.g. def func(param1, param2)
# Arguments are the actual values passed in when a func is called e.g. func(arg1, arg2) will call func and assign param1 = arg1 and param2 = arg2
# Params can be assigned using positional (matches args to param based on position) or keyword (matches args to params based on name) arguments passed in
# Some 
# Capture an arbitrary amount of args with *args and **kwargs
def func2(param1, param2, param3 = ".", param4 = None):         # param3 and param4 have default arg values so don't have to have args passed in to define them
    a = param1 + " " + param2
    a += param3
    if param4: a += param4
    print(a)

func2("Hello", "World")                                             # don't have to give args for params with default values
func2("Hello", "World", "!")
func2("Hello", "World", "!", " Extra")                              # give args for each param (have to define param3 to define param4)
func2(param4 = " Extra", param2 = "World", param1 = "Hello")        # can define params using keywords in any order + do not have to define param3 to define param4
func2("Hello", "World", param4 = " Extra")                          # can do the same by using positional args then keyword args (positional args MUST come first)

# Special parameters
# 
def func3(param1, param2, /, param3 = ".", *, param4 = None):
    a = param1 + " " + param2
    a += param3
    if param4: a += param4
    print(a)



# Arbitrary Argument lists
# We can take in an arbitrary number of positional and keyword parameters using the * and ** prefix
# The correct syntax is any num of positional args,  *arglist, any num of kwargs, **argdict e.g. func(arg1, arg2, *arglist, kwarg1, kwarg2, **argdict)
# So when calling func all positional args after the first 2 will be grouped into args
# And all keyword args except those specified for kwarg1 kwarg2 will be grouped into kwargs
def func4(punctuation, *args, extra, **kwargs):             # Everything after *args is a keyword param so extra is
    a = ""
    if len(args) >= 2: a = args[0] + " " + args[1]
    if 'key1' in kwargs: a += kwargs["key1"]
    if 'key2' in kwargs: a += kwargs["key2"]
    a += punctuation
    a += extra
    print(a)

func4(".", extra = " Extra")                                        # have to specify punctuation and extra params as they don't have  (args = [] and kwargs = {})
func4(".", "Hello", "World", extra = "Extra")                       # args = ["Hello", "World"] and kwargs = {}
func4("!", extra = "Extra", key1 = "!", key2 = "!")                 # args = [] and kwargs = {"key1": "!", "key2": "!"}
func4("!", extra = "Extra", key1 = "!", key2 = "!", key3 = "!")     # args = [] and kwargs = {"key1": "!", "key2": "!", "key3": "!"} but key3 is never used




#Lambda functions
# Lambda functions are 1 line/expression anonymous function that must return a value
def func5(x):
    return x + 10

func5 = lambda x: x + 10                           # same as above
func5 = lambda x = 0, *args, **kwargs: x + 10      # can take in args in all the same way a regular function can
