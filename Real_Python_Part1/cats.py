list_cats=[]
list_result=[]
#Populate list - avoids typing in
for n in range(1,101):
    list_cats.append(""+str(n))

print(list_cats)
list_result=list_cats[:]
#list_result=[]
print("Preparing to run")

for n in range(2,101):
    print("New seq {0}".format(n))
    for i in range(n,101,n):
        if i%n==0:
            if i in list_result:
                list_result.remove(i)
            else:
                list_result.append(i)
        
        #z=i
       # print(z)
        #compare = list_result[i]
        #print("New inner {0}".format(i))
        #list_result.remove("{}".format(i))
        #list_result.insert(i,""+str(i))
    #print(i)
#list_result.sort()    
print(list_result)    
   
    



    
#lst.insert(idx,val)
#lst.remove(value)
    #seq
