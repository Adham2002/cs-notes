############
# Booleans #
############
'''
Everything instace of a data type has a boolean value
Most variable with some sort of content in evaluate to true (None = False)
    - Any string is True, except empty strings
    - Any number is True, except 0
    - Any list, tuple, set, and dictionary are True, except empty ones
'''


# True
print(bool(True))
print(bool(15))
print(bool("Hello"))
print(bool(("tuple")))
print(bool(["list"]))
print(bool({"dict"}))

# False
print(bool(False))
print(bool(None))
print(bool(0))
print(bool(""))
print(bool(()))
print(bool([]))
print(bool({}))


# comparison operator boil down to True or False
print(10 > 9)
print(10 == 9)
print(10 < 9)



if value >= 0 and value <= 3:
    print("hello")

