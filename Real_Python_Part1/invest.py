def invest(amount,rate,time):
    result = amount
    print("principal amount:"+str(amount))
    print("annual rate of return :" + str(rate))
    for n in range(1,time+1):
        #result = result + amount
        result = result * rate
        amount = amount + result
        result = amount
        #Notice using format dont need to cast any values
        #print("year "+ str(n)+" £"+str(result))
        print("year {0} £ {1}".format(n,result))
    
    

print(invest(100,.05,8))
print(invest(2000,0.025,5))
