#Populate a database using a csv file

import sqlite3
import os
import csv
conn = sqlite3.connect('city.db')

#file_Path = 'C:/Tools/Python_Refresh/Python_Flask/Python_Flask/sqlite/SQL/'
file_Path = 'C:\Tools\Python_Refresh\Python_Flask\Python_Flask\sqllite\SQL'
with open(os.path.join(file_Path,"city.csv"),"r")as file_Read:
    file_Reader = csv.reader(file_Read)
    next(file_Reader)  # add this to miss first line - I.e Header.
    for n in file_Reader:
        print(n)
        