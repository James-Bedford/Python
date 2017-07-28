from suppliers import suppliers_dict
from random import randint


#need to covert dict to list so that random number will work
#once number is pulled
supplier_list = list(suppliers_dict.keys())
#print(supplier_list) #brings back keys
#print(supplier_list[1]) #trying to bring back populated list from dict
#print(len(supplier_list)) #works
#test calling back from list to dictionary
#print(supplier_list) #works
'''
print(suppliers_dict["TTF"]) #works
print(len(suppliers_dict)) #works
print(suppliers_dict.keys())#works
print(suppliers_dict.values())#works
'''
#print(supplier_list)#works
#now bring back the same but with an index
#print(supplier_list[1])#this works but brings back different values each time
                       #as the dictionay order changes
supplier_list.sort()
#print(supplier_list[1]) # works again but now [1] is always the same
#now using index reference back to dict and get value
#get_value=(supplier_list[1])
#print(suppliers_dict[get_value])#works
#answer_Req = (suppliers_dict[get_value])

#print(suppliers[supplier_list[1]]) #trying to reference dict using list
random_Select = randint(0,len(supplier_list))
get_value = (supplier_list[random_Select])

question_Key = (supplier_list[random_Select])
print(get_value)
answer_Req = (suppliers_dict[get_value])
while True:
    #random_Select = randint(1,len(supplier_list))
    #print(random_Select) #works
    #need a few things - key and value referenced from random int
    #question_Key = get_value(supplier_list[random_Select])
    print("Which country is "+ question_Key)
    user_input = input("Please enter: ")
    if(user_input=="Exit" or user_input=="exit"):
        print("Goodbye the answer was :"+answer_Req)
        break
        print("finished")
    if (user_input == answer_Req):
        print("Correct")
        break
    else:
        user_input = input("Wrong, try again:")
        
