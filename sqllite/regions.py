#Populate a database using a csv file

import sqlite3
import os
import csv

file_Path = 'C:\Tools\Python_Refresh\Python_Flask\Python_Flask\sqllite\SQL'
with sqlite3.connect('city.db')as connection:
    connect_db = connection.cursor()
    #open csv file and assign to  a variable
    #connect_db.execute('''CREATE TABLE Regions(city text,region TEXT)''')
    try:

        region = csv.reader(open('C:\Tools\Python_Refresh\Python_Flask\Python_Flask\sqllite\SQL\Regions.csv'))
       # connect_db.executemany('INSERT INTO Regions(city,region) VALUES(?,?)',region)
        #connect_db.execute('SELECT * from Regions')
       # c.execute("UPDATE camera SET location = 'Book Store' WHERE cameraid = '2'")
        #c.execute("DELETE FROM Camera WHERE cameraid = '2'")
        #connect_db.execute("""SELECT City.name, City.population,
        #regions.region FROM City, Regions
        #WHERE City.name = regions.city""")

        sql = {'average': "SELECT avg(population) FROM City",
              'maximum': "SELECT max(population) FROM City",
              'minimum': "SELECT min(population) FROM City",
              'sum': "SELECT sum(population) FROM City",
              'count': "SELECT count(name) FROM City"}




        rows = connect_db.fetchall()
        for keys,values  in sql.items():
            # run sql
            connect_db.execute(values)
            # fetchone() retrieves one record from the query
            result = connect_db.fetchone()
            # output the result to screen
            print(keys + ":", result[0])

    except sqlite3.OperationalError:
        print('Error has occured')