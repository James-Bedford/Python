import sqlite3
import os
import csv

file_Path = 'C:\Tools\Python_Refresh\Python_Flask\Python_Flask\sqllite\SQL'
with sqlite3.connect('cars.db') as connection:
    c = connection.cursor()
    try:
        load_database = csv.reader(open('C:\Tools\Python_Refresh\Python_Flask\Python_Flask\sqllite\SQL\cars.csv'))
        c.executemany('INSERT INTO cars(Make, Model, Quantity) VALUES(?,?,?)', load_database)
        rows = c.fetchall()
        for r in rows:
            print(r[0],r[1],r[2])
    except sqlite3.OperationalError:
        print('Error has occured')