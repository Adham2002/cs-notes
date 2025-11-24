#########################
# Files and Directories #
#########################
'''
To open the file, use the built-in open() function.
The open() function returns a file object, 
which has a read() method for reading the content of the file
'''


''' open file '''
#first we need the path
import os
path = os.path.join(os.getcwd(),"filename.txt") # or
path = "./filename.txt"
f = open(path, "rt")               # opens a txt file for reading (default value)
# error if the file does not exist
f = open(path, "ab")               # opens a binary file for appending
# creates the file if it does not exist
f = open(path, "wt")               # opens a txt file for writing (overwrites)
#creates the file if it does not exist
f = open(path, "xb")               # creates the specified binary file
#returns an error if the file exists

f = open("D:\\myfiles\welcome.txt", "r")    # if file not in local directory
with open("demofile.txt") as f:             # closes file automatically after loop
    pass                                    # do any file reading or writing here



''' reading from file '''
print(f.read())                             # prints whole text
print(f.read(5))                            # prints first 5 characters of text
print(f.readline())                         # prints first line of text
for x in f:                                 # iterates over every line in the text
  print(x)



''' writing to file '''
f.write("Now the file has more content!")



''' closing file '''
f.close()                                   # good practice to always close files



''' delete file '''
import os
if os.path.exists("demofile.txt"):
  os.remove("demofile.txt")                 # delete file
else:
  print("The file does not exist")

os.rmdir("myfolder")                        # delete folder



''' file paths '''
