''' Strings '''

# can use single or double quote marks
print("Hello")
print('Hello')

# you can assign a multiline string to a variable by using three quotes
a = """Lorem ipsum dolor sit amet,
consectetur adipiscing elit,
sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua."""

a = "Hello, World!"


''' Strings are Arrays '''
# they can be:
print(a[1])             # accessed like arrays
for x in a:             # iterated over like arrays
  print(x)
print(len(a))           # length checked like arrays
print("Hell" in a)    # checked like arrays
print(a[2:5])           # sliced like arrays



''' Modifying strings '''
print(a.upper())               # converts string to upper case
print(a.lower())	           # converts string to lower case
print(a.casefold())            # does the same thing
print(a.swapcase())	           # swaps cases so lower case becomes upper case and vice versa
print("ttt".capitalize())      # converts the first character to upper case
print(a.title())	           #Converts the first character of each word to upper case


print("  hello  ".strip())     # removes spaces at the beginning and at the end of the string
print("  hello  ".lstrip())    # removes spaces at the beginning of the string
print("  hello  ".rstrip())    # removes spaces at the end of the string

print(a.replace("H", "J"))     # replaces any instance of H with J

max_split = 2 
keeplinebreaks = True                     # specifies how 
print(a.split(",", max_split))            # returns ['Hello', ' World!']
print(a.rsplit(",", max_split))	          # does the same but starts from the right
print(a.splitlines(keeplinebreaks))	      # splits the string at line breaks
# keeplinebreaks specifies if the line breaks should be included (True), or not (False). Default value is False
a.partition('l')	       # returns ("He", "l", "lo, World!")
a.rpartition('l')	       # returns ("Hello, Wor", "l", "d!")


''' Format strings '''
a = "Hello"
b = "World"
c = a + b       #concatination
print(c)

name = "John Smith"
print(f"Hello, {name}")

#Use the format() method to insert numbers into strings:
quantity = 3
itemno = 567
price = 49.95
myorder = "I want {} pieces of item {} for {} dollars."
print(myorder.format(quantity, itemno, price))

quantity = 3
itemno = 567
price = 49.95
myorder = "I want to pay {2} dollars for {0} pieces of item {1}."
print(myorder.format(quantity, itemno, price))

characters = {'Man':'Aragorn', 'Dwarf':'Gimli'}
print('{Man} is a friend of {Dwarf}'.format(**characters))


#escape characters
# To insert characters that are illegal in a string use escape characters
txt = "We are the so-called \"Vikings\" from the north."
#\'	Single Quote	
#\\	Backslash	
#\n	New Line	
#\r	Carriage Return	
#\t	Tab	
#\b	Backspace	
#\f	Form Feed	
#\ooo	Octal value	
#\xhh	Hex value



''' checks '''
"afds45gf".isalnum()	           # returns True if all characters in the string are alphanumeric
"afdsgf".isalpha()	               # returns True if all characters in the string are in the alphabet
"214324".isdecimal()	           # returns True if all characters in the string are decimals (0-9)
"\u00B2".isdigit()	               # same as above but includes ² and ¾
"214324".isnumeric()	           # same as above but includes ² and ¾
"Variable_name3".isidentifier()	   # returns True if string is a valid identifier
# an identifier follows the rules of variable names
#contains alphanumeric letters (a-z) and (0-9), or underscores (_) and cannot start with a number or contain any spaces 
"any".isprintable()	               #Returns True if all characters in the string are printable (Example of none printable character can be carriage return and line feed.)
"  \n  ".isspace()	               # returns True if all characters in the string are whitespaces
"Hello world".istitle()	           # returns True if the string starts with a capital letter
"JDVKJSDV".isupper()	           # returns True if all characters in the string are upper case
"kriorgvvf".islower()	           # returns True if all characters in the string are lower case
"hello".startswith("hell")	       #Returns true if the string starts with the specified value
"new word".endswith('word')	       #Returns true if the string ends with the specified value



''' searching string '''
a.count('l')	           # returns the number of times a specified value occurs in a string
a.index('o')	           # returns the first position where 'o' was found (throws error if no occurances)
a.find('o')	             # same as above but returns -1 if no occurance found
a.rindex('o')	           # returns the last position where 'o' was found (throws error if no occurances)
a.rfind('o')	           # same as above but returns -1 if no uccurance found




''' other '''
words = "hello world new word"
"hey".center(10,'-')	              # returns '---hey----'
"hey".ljust(10,'-')	                  # returns 'hey-------'
"hey".rjust(10,"-")	                  # returns '-------hey'
"Ståle".encode("ascii","ignore")	  # returns an encoded version of the string 
# unkown characters are handled by the error function (in this case ignores the chars)
# other error functions
#'backslashreplace'	- uses a backslash instead of the character that could not be encoded
#'namereplace'	- replaces the character with a text explaining the character
#'strict'	- Default, raises an error on failure
#'replace'	- replaces the character with a questionmark
#'xmlcharrefreplace'	- replaces the character with an xml character

"h\th".expandtabs(2)	        # sets the tab size of the string (default=8)
"-".join(("John", "Peter"))	    # joins the elements of the specified iterable with the string to make a new string

#https://www.w3schools.com/python/ref_string_maketrans.asp
mytable  = words.maketrans("h", "H")               # use the maketrans() method to create a mapping table
#https://www.w3schools.com/python/ref_string_translate.asp
words.translate(mytable)	            # returns a string where some specified characters are replaced with the character described in a dictionary, or in a mapping table
words.zfill(3)	                #Fills the string with a specified number of 0 values at the beginning
