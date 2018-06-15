#Populate a database using a csv file

import sqlite3
import os
import csv

file_Path = 'C:\Tools\Python_Refresh\Python_Flask\Python_Flask\sqllite\SQL'
with sqlite3.connect('new.db')as connection:
    c = connection.cursor()
    #open csv file and assign to  a variable
    try:

        cameras = csv.reader(open('C:\Tools\Python_Refresh\Python_Flask\Python_Flask\sqllite\SQL\camera.csv'))
        c.execute('CREATE Table Camera(cameraid,ip,location)')
        c.executemany('INSERT INTO Camera(cameraid,ip,location) VALUES(?,?,?)',cameras)
        c.execute('SELECT cameraid,ip,location from camera')
        rows = c.fetchall()
        for r in rows:
            print(r[0],r[1],r[2])
    except sqlite3.OperationalError:
        print('Error has occured')
