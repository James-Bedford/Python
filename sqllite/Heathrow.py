import sqlite3
import os
import csv
conn = sqlite3.connect('Heathrow.db')
create_db = conn.cursor()
create_db.execute('''CREATE TABLE Cameras(Name TEXT,IP TEXT)''')
conn.close()
with sqlite3.connect('Heathrow.db') as connection:
    input_data = connection.cursor()
    try:
        file_input_data = csv.reader(open(r'C:\Tools\Python_Refresh\Python_Flask\Python_Flask\sqllite\SQL\Heathrow.csv'))

        input_data.executemany('INSERT INTO Cameras(id,Name)VALUES(?,?)',file_input_data)
    except sqlite3.OperationalError:
        print('Error has occured')