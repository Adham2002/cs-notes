
''' Arithmetic Operators '''
x = 7
y = 3
print(x + y)	                           # +	Addition	
print(x - y)	                           # -	Subtraction	
print(x * y)	                           # *	Multiplication	
print(x / y)	                           # /	Division	
print(x % y)	                           # %	Modulus	
print(x ** y)	                           # **	Exponentiation	
print(x // y)	                           # //	Floor division	



''' Comparison Operators '''
print(x == y)                              # ==	Equal	
print(x != y)                              # !=	Not equal	
print(x > y)                               # >	Greater than	
print(x < y)                               # <	Less than	 
print(x >= y)                              # >=	Greater than or equal to	
print(x <= y)                              # <=	Less than or equal to	



''' Assignment Operators '''
x = 5
x += 3                                     #same as x = x + 3	
x -= 3                                     #same as x = x - 3	
x *= 3                                     #same as x = x * 3	
x /= 3	                                   #same as x = x / 3	
x %= 3	                                   #same as x = x % 3	
x //= 3	                                   #same as x = x // 3	
x **= 3	                                   #same as x = x ** 3	
x &= 3	                                   #same as x = x & 3	
x |= 3	                                   #same as x = x | 3	
x ^= 3	                                   #same as x = x ^ 3	
x >>= 3	                                   #same as x = x >> 3	
x <<= 3	                                   #same as x = x << 3



''' Logical Operators '''
print(x < 5 and  x < 10)                   # Returns True if both statements are true
print(x < 5 or x < 4)	                   # Returns True if one of the statements is true
print(not(x < 5 and x < 10))               # Reverse the result, returns False if the result is true



''' Identity and Memership Operators '''
x is y                                     # Returns True if both variables are the same object	
x is not y	                               # Returns True if both variables are not the same object	
x in y	                                   # Returns True if a sequence with the specified value is present in the object	
x not in y                                 # Returns True if a sequence with the specified value is not present in the object	



''' Bitwise Operators '''
1 & 0 	                                   # AND - Sets each bit to 1 if both bits are 1
1 | 0	                                   # OR - Sets each bit to 1 if one of two bits is 1
1 ^ 0	                                   # XOR - Sets each bit to 1 if only one of two bits is 1
~ 1                                        # NOT - Inverts all the bits
1 << 1	                                   # Zero fill left shift - Shift left by pushing zeros in from the right and let the leftmost bits fall off
1 >> 1                                     # Signed right shift - Shift right by pushing copies of the leftmost bit in from the left, and let the rightmost bits fall off
