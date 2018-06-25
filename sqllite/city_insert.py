#Populate a database using a csv file

import sqlite3
import os
import csv

file_Path = 'C:\Tools\Python_Refresh\Python_Flask\Python_Flask\sqllite\SQL'
with sqlite3.connect('city.db')as connection:
    connect_db = connection.cursor()
    #open csv file and assign to  a variable
    #create_db.execute('''CREATE TABLE City(name text,state TEXT,population INT)''')
    try:

        city = csv.reader(open('C:\Tools\Python_Refresh\Python_Flask\Python_Flask\sqllite\SQL\city.csv'))
        connect_db.executemany('INSERT INTO City(name,state,population) VALUES(?,?,?)',city)
        connect_db.execute('SELECT * from city')
       # c.execute("UPDATE camera SET location = 'Book Store' WHERE cameraid = '2'")
        #c.execute("DELETE FROM Camera WHERE cameraid = '2'")
        rows = connect_db.fetchall()
        for r in rows:
            print(r[0],r[1],r[2])
    except sqlite3.OperationalError:
        print('Error has occured')
