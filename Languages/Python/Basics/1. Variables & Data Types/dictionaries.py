################
# Dictionaries #
################
'''
dictionaries are the same as hash maps
All the elements in a dcitionary have a key value pair where the keys have to be unique
This means lookup time is O(1)

attributes
Ordered - items have a defined unchanging order
Mutable - the value of a key value pair can change
No duplicates - keys have to be unique
'''



''' create a dictionary '''
new_dict = dict([(2,5),(3,8)])
new_dict3 = {'key1':1, 'key2':2, 'key3':3, 'key4':4, 'key4':4}
# Zipping 2 arrays together can make corresponding elements into key, value pairs
array = ['key1', 'key2', 'key3', 'key4']
array2 = [1,2,3,4]
new_dict2 = dict(zip(array,array2)) # can use zip to create an array of 2-tuples

# Dictionary comprehension
people = ["harry", "lisa", "sally"]
arcade_profiles = {
    person: {
        "score": 0,
        "tokens": 100
    }
    for person in people
}


''' add an element '''
new_dict['key1'] = 1
# or
new_dict.update({'key2': 2, 'key3': 3}) # can be used to add multiple elements

new_dict['key3'] = [2,5,6,7] # value of a dictionary item can be any type and are mutable (can change)
new_dict[True] = [2,5,6,7] # dictionary keys have to be immutable (strings, tuples, ints, bool(True=1, False=0)) unlike the values
print(hash('key')) # hash() method used python's hash function to output hashed value



''' access items '''
value = new_dict['key1'] # gets the value given the key
# or 
value = new_dict.get('key1')
print('key1' in new_dict)  # checks whether a key is in the dict

# iterate over dictionary
for key,value in new_dict.items():
    print('key:',key,'value:',value) # iterate over key value pair

for key in new_dict:    #or new_dict.keys()
    print('key:',key,'value:',new_dict[key]) # iterate over keys

for value in new_dict.values():
    print('value:',value) # iterate over values



''' remove an element '''
del new_dict['key1'] # just deletes item
value = new_dict.pop('key2')  # returns just value popped
key, value = new_dict.pop('key2') # returns key and value popped
new_dict.clear() # clears all elements from dictionary
del new_dict # deletes the dict entirely



''' other '''
print(len(new_dict2)) # for length
print(type(new_dict2)) # from Python's perspective, dictionaries are defined as objects with the data type 'dict'
copy = new_dict2.copy() # creates copy
copy2 = dict(new_dict2) # creates copy
x = new_dict2.setdefault('key2', 33)         # returns value at specified key ('key1')
x = new_dict2.setdefault('key5', 33)         # but if the key doesn't exist it creates a new element with specifies key value pair ('key5',33)
                                             #and returns the specified value (33)
