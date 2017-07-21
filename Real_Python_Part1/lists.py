tso = ["TTF","National Grid"]
print(tso)
print("Sorting")
tso.sort()
print(tso)
print("Index of TTF {0}".format( tso.index("TTF")))
new_tso = tso[:] #copies 
print(new_tso)
new_tso.append("EON")
new_tso.extend(["Gazprom","GasunieD"])
print(new_tso)
print(tso)
tso_string = "Gasunie,OGE,Non LGE"
tso_string_list = tso_string.split(",")
print(tso_string_list)


def list_of_numbers(list_of):
    calc = list_of[:]  #copies list but as a new object
    print(calc[0:4])  #print first four items


list_of_stuff = [2,4,8,16,32,64]
print(list_of_numbers(list_of_stuff))
