
#opens and existing or creates a new file and writes text and closes it.
'''commneted out or just keeps rewriting all output
my_output_file = open("hello.txt","w")
my_output_file.writelines("This is file one")
my_output_file.close()
'''
#to just read the file
my_read_file = open("hello.txt","r")
print(my_read_file.readlines())
my_read_file.close()


#to add text to a an exisiting file - on a new line
my_output_file = open("hello.txt","a")
text_To_Add = ["\nNew line, new text"]
my_output_file.writelines(text_To_Add)
my_output_file.close()

#reads files and output each new line to a new line - , after print statement
#does this.
my_read_file = open("hello.txt","r")

for n in my_read_file.readlines():
    print(n),

my_read_file.close()

#end function can be used to control end of line
#Here a double ne line is added
my_read_file = open("hello.txt","r")

for n in my_read_file.readlines():
    print(n,end="\n\n")

my_read_file.close()

#Using with allows you not to have to  use close()
#New file created and written to.
with open("hello.txt","r") as my_input, open("hi.txt","w") as my_output:
    for n in my_input.readlines():
        my_output.write(n)

#using seek()
my_input_file = open("hello.txt","r")
print ("Line 0(first line):",my_input_file.readline())

my_input_file.seek(0)
print ("Line 0 again:", my_input_file.readline())
print("Line 1:", my_input_file.readline())

my_input_file.seek(8) #jump to char at index 8
print("Line 0(starting at 9th character):",my_input_file.readline())

my_input_file.seek(10,0)
print("Line 0(starting at 11th character):",my_input_file.readline())

my_input_file.close()



#to change file paths and use fun like rmdir mkdir need to import os module

import os

path = "C:/Users/jbedford/Gazprom/Win_Python/WinPython-64bit-3.5.3.1Qt5/notebooks/work/Refresh"

win_Style_Path = r"C:\Users\jbedford\Gazprom\Win_Python\WinPython-64bit-3.5.3.1Qt5\notebooks\work\Refresh\doc_folder"

my_Input_File = os.path.join(path,"hello.txt")

with open(my_Input_File,"r")as file_reader:
    for n in file_reader.readlines():
        print(n)



        
    
