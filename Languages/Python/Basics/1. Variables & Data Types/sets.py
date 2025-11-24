'''
sets the same as hash sets or mathematical sets
All the elements in a set have to be unique

attributes
Unordered - items do not have a defined order
Imutable - the elements of a set cannot be changed (but can be added or removed)
No duplicates - elemets have to be unique
'''


''' create a set '''
new_set = set([26, 'effe', True, (2,434,5)]) # can cast an array to a dictionary
# or
new_set2 = {1,45,44,'tt'} # can be used to start with some initial elements



''' add an element '''
new_set.add(22)
# or
new_set.update({11, 33}) # can be used to add multiple elements

new_set.add((77,88)) # new set elements have to be immutable (strings, tuples, ints, bool(True=1, False=0))



''' access items '''
print('effe' in new_set)  # checks whether an element is in the set

# iterate over set
for x in new_set:
    print(x) # iterate over elements in a random order



''' remove an element '''
new_set.remove(26)  # removes an element if it is in the set
new_set.discard(4444444)  # removes an element if it is in the set and doesn't return an error if it isn't
val = new_set.pop() # removed an element at random from the set and return it
new_set.clear() # clears all elements from set
del new_set # deletes the set entirely


''' set operations '''
set1: set[object] = {2,6,8,3}
set2 = {'trei', True, False}

#set union
set3 = set1.union(set2)     # returns a set containing the union of sets
set1.update(set2)           # updates the set with the union of this set and two or more sets

#set intersection
set3 = set1.intersection(set2)                  # returns a set, that is the intersection of two other sets
set1.intersection_update(set2)                	# removes the items in this set that are not present in other, specified set(s)

#set difference
set3 = set1.difference(set2)                    # returns a set containing the difference between two or more sets
set3 = set1 - set2                              # or
set1.difference_update(set2)                    # removes the items in this set that are also included in another, specified set
set1.symmetric_difference(set2)             	# returns a set with the symmetric differences of two sets
set1.symmetric_difference_update(set2)          # inserts the symmetric differences from this set and another

#set inclusion checks
print(set1.isdisjoint(set2))                    # returns whether two sets have a intersection or not
print(set1.issubset(set2))                      # returns whether another set contains this set or not
print(set1.issuperset(set2))                    # returns whether this set contains another set or not



''' other '''
print(len(new_set2)) # for length
print(type(new_set2)) # from Python's perspective, sets are defined as objects with the data type 'set'
copy = new_set2.copy() # creates copy
copy2 = set(new_set2) # creates copy
