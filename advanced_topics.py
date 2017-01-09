my_dict = {"Name":"James","Age":45,"Sex":"Male"}
print (my_dict.items())
print (my_dict.values())
print(my_dict.keys())



for i in my_dict:
    print (i) #prints out the keys only
    print (my_dict[i]) #prints out the dict values

l = [i ** 2 for i in range(1, 11)]
# Should be [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
#slice [start,end,stride]
print (l[2:9:2]) #[9,25,49,81]
print (l[2:9:1]) #[9,16,25,36,49,64,81]

to_five = ['A','B','C','D','E','F','G']

print (to_five[1:6:3]) #['B','E']

my_list = range(1,11)
print(my_list[::2])  #should print [1,3,5,7,9] but dosent here
