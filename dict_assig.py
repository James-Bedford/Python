from suppliers import suppliers_dict
import random


#need to covert dict to list so that ramdom number will work
#once number is pulled
supplier_list = list(suppliers_dict.keys())
print(supplier_list)
print(supplier_list[1])
while True:
    user_input = input("Please enter answer: ")
    if(user_input=="Exit" or user_input=="exit"):
        break
        print("finished")
