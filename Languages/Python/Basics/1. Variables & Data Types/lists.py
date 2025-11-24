'''
Lists

attributes
Ordered - items have a defined unchanging order
Mutable - the value of elements can change
Duplicates allowed - lists work on idexes so elements can be the same
'''



''' create a list '''
array = list((2,34,5,844,33,2,11)) # can cast an tuple to a list to make it changable
array2 = list("hello world") # can cast a string to a list to access each character (although strings already work as a list of characters for most things)
# or
array3 = [1,(45,1,2,3),True,'tt',1] # can be used to start with some initial elements which can be of any data type

# list comprehensions offer a shorter syntax + faster execution using a C for loop under the hood
iterable = [1,2,3]
condition = True
newlist = [item + 1 for item in iterable if condition == True]      # if statement is optional



''' add an element '''
array.append(22)       # adds element to the end of array
array.insert(2, 3)     # inserts the object (3) at the index (2) thereby moving the index of everything after that up by 1
array.extend([11, 22, 33]) # can be used to add multiple elements
array.extend((11, 22, 33)) # can use any iterable  to add elements
new = array + array2 # join 2 lists

array[1:3] = [0,0]  # we can change the value of multiple elements using slices (changes second and third element to 0s)
array[1:2] = [1,1]  # if the elements to be added are bigger than the slice the extra elements will be inserted after the end of the slice
array[1:3] = [6]    # if the elements to be added are smaller than the slice the other sliced elements will be removed



''' access items '''
print(array[2])   # lists can be accesses through indexes and indexing starts at 0 so array[2] will access the 3rd element
print(array[-1])  # lists can also be indexed from the back using negative numbers so array[-1] is the last element
start, stop = 2, 5
sliced = array[start:stop] # lists can also be sliced allowing access to specific sections of the array (this slice will take start through to stop - 1 )
sliced = array[start:]     # takes items start through the rest of the array
sliced = array[:stop]      # takes items from the beginning through stop-1
sliced = array[:]          # a copy of the whole array

print(2 in array)  # checks whether an element is in the array



''' remove an element '''
array.remove(2)    # removes an object from the list (if there are multiple removes a random one)
val = array.pop(1) # removed the element at specified index and return it
val = array.pop()  # if no index is specified the last element is removed
del array[0]       # removed the element at specified index
array.clear()      # clears all elements from array
del array          # deletes the array entirely



''' iterating over lists '''
for x in array2:
    print(x) # iterate over elements in index order

for i, element in enumerate(array2):
    print('index:',i,'element:',element) # iterate over elements while also keeping keeping a loop counter


newlist2 = [x for x in array2 if x != "l"]
newlist3 = [x for x in array2]                      # original list
newlis4 = [x.upper() for x in array2]               # converts every string to upper case
newlist5 = ['hello' for x in array2]                # list full of 'hello'
newlist6 = [x for x in range(10)]                   # uses range to iterate over 0 to 9
newlist7 = [x for x in range(10) if x < 5]          # can still use if statement with range
[print(x) for x in array2]                          # prints the elements but nothing specified for new list elements so they are all None




''' sorting lists '''
def myfunc(n):
  return abs(n - 50)
numbers = [100, 50, 65, 82, 23]
words = ["orange", "mango", "kiwi", "pineapple", "banana"]
numbers.sort()                  # sorts the list alphabetically, ascending, by default
numbers.sort(reverse=True)      # used to sort in decending order
words.sort()                    # can also sort the list numerically

numbers.sort(key = myfunc)      # key function is applyed to each element in the list then it is sorted
words.sort(key = str.lower)     # sort() is case sensitive, resulting in all capital letters being sorted before lower case letters
for i in sorted(numbers):       # sorted will return an iterable that iterates over a sorted array
    print(i)                    # can also use key


''' other '''
print(len(array2))              # for length
print(type(array2))             # from Python's perspective, sets are defined as objects with the data type 'list'
array2.reverse()                # reverses order of list INPLACE
copy = array2.copy()            # creates copy
copy2 = list(array2)            # creates copy
index = array2.index('l')       # returns the index of the first element with the specified value
c  = array2.count('l')          # returns the number of elements with the specified value
