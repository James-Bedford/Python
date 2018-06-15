import sqlite3
conn = sqlite3.connect("new.db")
cursor = conn.cursor()
cursor.execute("""CREATE TABLE populaton
(city TEXT,state TEXT,population INT)""")
#close connection
conn.close()
