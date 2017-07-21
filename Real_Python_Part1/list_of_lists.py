def tso_enrollement(user_Tso):
   
    list_Detail=user_Tso[:]
    for n in range (0,len(list_Detail)):  
        print(list_Detail[n][1])

def total_found(user_Tso):
    list_Detail=user_Tso[:]
    total = 0
    for n in range (0,len(list_Detail)):
        total = total+(list_Detail[n][1])
    return total

tso = [['TTF', 2175, 37704],
['GD', 19627, 39849],
['NG', 10566, 40732],
['PEG', 7802, 37000],
['Fluxys', 5879, 35551],
['Uberackern', 19535, 40569],
['Jemgum', 11701, 40500]]

print(tso_enrollement(tso))
print("The total is: {0}".format(total_found(tso)))

