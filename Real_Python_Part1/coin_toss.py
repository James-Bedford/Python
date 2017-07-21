from random import randint

heads=0
tails= 0
for n in range(1,10000):
    result = randint(0,1)
    if (result== 0):
        tails = tails +1
    else:
        heads = heads +1
print("Result for H is {0} for T is {1}".format(heads,tails))
