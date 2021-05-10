class Person:
    def __init__(self, fname, lname):
        self.firstname = fname
        self.lastname = lname

    def printname(self):
        print(self.firstname, self.lastname)
    
    def printFirstname(self):
        print(self.firstname, " parent")

class Student(Person):

    def printLastname(self):
        print(self.lastname)
        
    def printFirstname(self):
        print(self.firstname, " child") # overwriting as we want to call it child
        
    def printFullname(self):
        #self.printFirstname()  # Firstname from student
        super.printFirstname()  # Firstname from parent
        self.printLastname()

x = Student("Mohammad", "Ahmadi")
x.printname() # student nadare, mire az valedesh seda mizane
# x.printLastname()
# x.printFullname()