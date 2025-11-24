'''
tuples

attributes
Ordered - items have a defined unchanging order
Immutable - the values of elements cannot change and more items cannot be added
Duplicates allowed - lists work on idexes so elements can be the same
'''



''' create a tuple '''
tuple1 = tuple([2,34,5,844,33,2,11]) # can cast an list to a tuple to make it changable
tuple2 = ("hello",) # one tuples need a comma
# or
tuple3 = (1,(45,1,2,3),True,'tt',1) # can be used to start with some initial elements which can be of any data type

# when we create a tuple, we normally assign values to it. This is called "packing" a tuple
(a, b, c, d, e) = tuple3
# a = 1
# b = (45,1,2,3)
# c = True
# d = 'tt'
# e = 1

# if the number of variables is less than the number of values we use * to assign the rest of the variable to the *ed variable as a list
(a, *b, c) = tuple3
# a = 1
# b = [(45,1,2,3), True, 'tt', 1]
# c = 1



''' access items '''
print(tuple1[2])   # tuples can be accesses through indexes and indexing starts at 0 so array[2] will access the 3rd element
print(tuple1[-1])  # tuples can also be indexed from the back using negative numbers so array[-1] is the last element
start, stop = 2, 5
sliced = tuple1[start:stop] # tuples can also be sliced allowing access to specific sections of te array (this slice will take start through to stop - 1 )
sliced = tuple1[start:]     # takes items start through the rest of the array
sliced = tuple1[:stop]      # takes items from the beginning through stop-1
sliced = tuple1[:]          # a copy of the whole tuples

print(2 in tuple1)  # checks whether an element is in the tuple



''' add an element '''#
# tuples are immutable so you have to convert to a list (is mutable) first
tuple1 = list(tuple1)   # can change the tuple to a list to edit it
tuple1.append(22)       # adds element to the end of array
tuple1 = tuple(tuple1)  # then change it back when finished

new = tuple1 + tuple2 # joining 2 tuples doesn't require casting to a list
new = tuple3 * 2      # can also multiply tuples by 2

''' remove an element '''
tuple1 = list(tuple1)   # use same workaround
tuple1.remove(2)    # removes an object from the list (if there are multiple removes a random one)
tuple1 = tuple(tuple1) # then change it back when finished

del tuple1 # deletes the tuple entirely



''' iterating over lists '''
for x in tuple3:
    print(x) # iterate over elements in index order

for i, element in enumerate(tuple3):
    print('index:',i,'element:',element) # iterate over elements while also keeping keeping a loop counter

# list conprenension offers a shorter syntax when you want to create a new list based on the values of an existing list / iterable
# the syntax:
newlist = [expression for item in iterable if condition == True]

newlist = [x for x in tuple3 if x != "l"]
#if statement is not reqiued
newlist = [x for x in tuple3]          # original list
newlist = [x.upper() for x in tuple3]  # converts every string to upper case
newlist = ['hello' for x in tuple3]    # list full of 'hello'
#can use any iterable including range()
newlist = [x for x in range(10)]          # 0 to 9
newlist = [x for x in range(10) if x < 5] # 0 to 4
# prints the elements but nothing specified for new list elements so they are all None
[print(x) for x in tuple3]



''' other '''
print(len(tuple3)) # for length
print(type(tuple3)) # from Python's perspective, sets are defined as objects with the data type 'list'
copy = tuple3.copy() # creates copy
copy2 = tuple(tuple3) # creates copy
index = tuple3.index('l') # returns the index of the first element with the specified value
count = tuple3.count() # returns the number of elements with the specified value
