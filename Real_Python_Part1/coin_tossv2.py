from random import randint

heads=0
tails= 0
for n in range(1,10):
    tresult = randint(0,1)
    if (tresult== 0):
        #tails = tails +1
        for j in range(1,10):
            hresult = randint(0,1)
            if (hresult== 1):
                heads = heads +1
    else:
        #heads = heads + 1
        for k in range(1,10):
            tresult = randint(0,1)
            if (tresult== 0):
                tails = tails +1
        
        
    
print("Result for H is {0} for T is {1}".format(heads,tails))
