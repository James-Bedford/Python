import mysql.connector

#connect to mysql 
#run select - once working chart
#with mysql.connector.connect(user="james",password="CrowdVision2017",host="192.168.0.113",port="3306" ,database="AMS")as connection:
connection = mysql.connector.connect(user="james",password="CrowdVision2017",host="192.168.0.113",port="3306",database="AMS")
c = connection.cursor()
c.execute("SELECT COUNT(*) FROM AMS.ts_macro_live")
rows = c.fetchall()
for r in rows:
		print(r[0])

connection.close()