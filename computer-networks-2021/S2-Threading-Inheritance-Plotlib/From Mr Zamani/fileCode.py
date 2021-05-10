"""
when we want to write a code which may result in some errors, like when we want
to write into a server or to do suket programming we use this procedures
"""
import os # for working with files

path = os.getcwd() # finding the current path
print("current path is: {}".format(path))

try:
    os.mkdir('newFolder') # making a new directory and telling if exists
except:
    print("This folder already exists!")
    pass

os.chdir(path + '/newFolder') # to change the directory
print("new path: {}".format(os.getcwd()))
#----------------------------------------------------------------
file = open("tst.txt", "w")
file.write("Hi\nMy name is pooya khandel")
file.close()
#----------------------------------------------------------------
with open("tst.txt", 'r') as fileReading:
    r1 = fileReading.readlines() 
    print(r1)
    fileReading.close()