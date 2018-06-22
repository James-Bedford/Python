import sqlite3
import os
import csv
conn = sqlite3.connect('Crowdvision.db')
create_db = conn.cursor()
#create_db.execute('''CREATE TABLE Site(id INT,Name TEXT,Terminals INT)''')
conn.close()
with sqlite3.connect('crowdvision.db') as connection:
    input_data = connection.cursor()
    try:
        file_input_data = csv.reader(open('C:\Tools\Python_Refresh\Python_Flask\Python_Flask\sqllite\SQL\sites.csv'))

        #input_data.executemany('INSERT INTO Site(id,Name,Terminals) VALUES(?,?,?)', file_input_data)
        #c.execute('SELECT cameraid,ip,location from camera')
        # c.execute("UPDATE camera SET location = 'Book Store' WHERE cameraid = '2'")
        # c.execute("DELETE FROM Camera WHERE cameraid = '2'")

        input_data.execute('UPDATE Site SET TERMINALS = 2 WHERE id in( 2,7 )')
        #input_data.execute('SELECT * FROM Site Where Terminals <5')
        #input_data.execute("SELECT * FROM Site WHERE Name = 'LHR'")
        input_data.execute("SELECT * FROM Site WHERE  Name LIKE '%G%'")
        rows = input_data.fetchall()
        for r in rows:
            print(r[0], r[1], r[2])




    except sqlite3.OperationalError:
        print('Error has occured')
