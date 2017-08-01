#csv functionality
import os
import csv

file_Path = "C:/Users/jbedford/Gazprom/Win_Python/WinPython-64bit-3.5.3.1Qt5/notebooks/work/Refresh"

with open(os.path.join(file_Path,"wonka.csv"),"r")as file_Read:
    file_Reader = csv.reader(file_Read)
    for n in file_Reader:
        print(n)
with open(os.path.join(file_Path,"wonkatab.csv"),"r")as file_Read:
    file_Reader = csv.reader(file_Read,delimiter="\t")
    next(FileReader) #add this to miss first line - I.e Header.
    for n in file_Reader:
        print(n)
                             
#Creating and writing a csv file

with open(os.path.join(file_Path,"create.csv"),"w") as file_Write:
    file_Writer = csv.writer(file_Write)
    file_Writer.writerow(["TSO","Country of Origin"])
    file_Writer.writerow(["National Grid","UK"])
    file_Writer.writerow(["Gasunie","Germany"])
    file_Writer.writerow(["GazProm","Russia"])

#Using writerows method


tso_File = [["TSO","Country of Origin"],
                ["National Grid","UK"],
                ["EDF","France"],
                ["RWE","Germany"]]
with open(os.path.join(file_Path,"create_two.csv"),"w") as tso_File_Write:
    file_Writer = csv.writer(tso_File_Write)
    file_Writer.writerows(tso_File)
    
        
    
