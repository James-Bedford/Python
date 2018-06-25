import sqlite3
import random

b=[]
with sqlite3.connect('onehundred.db')as connection:
    connect_db = connection.cursor()
    #connect_db.execute('''CREATE TABLE oneh( random INT)''')

    for a in range ( 0,100,1):
        b.append (random.randint(0,100))
        choice = (b[a])
        print(choice)
        connect_db.execute("INSERT INTO oneh(choice) VALUES(?)", (choice,))
    #connect_db.execute("INSERT INTO oneh(choice) VALUES('19')") #works
    #connect_db.execute("INSERT INTO oneh(choice) VALUES(12)") #works
    #connect_db.execute("INSERT INTO oneh(choice) VALUES(?)",pla) #not work
    #connect_db.execute("INSERT INTO oneh(choice) VALUES(?)",('13')) #not work
    #connect_db.execute("INSERT INTO oneh(choice) VALUES(?)",(pla,)) #works
    #connect_db.execute("INSERT INTO oneh(choice) VALUES(?)",(choice,)) #works
    #connection.commit()
connection.commit()
user_input = input("Please select AVG, SUM, MAX or MIN")
if user_input.upper() == 'AVG':
    connect_db.execute("SELECT AVG(choice) FROM oneh")
elif user_input.upper() == 'SUM':
    connect_db.execute("SELECT SUM(choice)FROM oneh")
elif user_input.upper() == 'MAX':
    connect_db.execute("SELECT MAX(choice FROM oneh")
elif user_input.upper() == 'MIN':
    connect_db.execute("SELECT MIN(choice) FROM oneh")
else:
    print("Exititng Progam")
    exit()

rows = connect_db.fetchall()
for r in rows:
    print(r[0])
connection.close()
