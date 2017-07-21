from random import randint
print("Roll one")
roll= randint(1,6)
print("{0}".format(roll))


'''10,000 rolls '''

print("Starting the sequence")
#for n in range(1,10001)
n=1
result = 0
while n <10000:
    roll = randint(1,6)
    result = (result+ int(roll))
    n = n +1

print("Average is {0}".format(result/10001))
