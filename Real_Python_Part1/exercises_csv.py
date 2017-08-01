import os
import csv

file_Path = "C:/Users/jbedford/Gazprom/Win_Python/WinPython-64bit-3.5.3.1Qt5/notebooks/work/Refresh"

with open(os.path.join(file_Path,"pastimes.csv"),"r") as file_Read:
    file_Reader = csv.reader(file_Read,delimiter = "\n")
    next(file_Reader) # this jumps first line
    for n in file_Reader:
        print(n)
print(n.find("fightening"))

#print("The The The".find("e"))    
