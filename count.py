def count(sequence,item):
    count = 0
    for i in sequence:
       #print (index)
       if item ==i:
           count+=1
           print("Match")
       else:
           print("No match")
           print(item,i)
    user_message= ("Number of matching occurences is: %s" %str(count))
    return user_message


print(count([1,2,3,4,5,1,1],1))
