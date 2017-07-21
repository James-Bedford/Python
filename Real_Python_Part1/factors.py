user_input= input("Enter a positive integer: ")
calc_input = int(user_input)
calc_input

for n in range(1,calc_input+1):
    if (calc_input % n==0):
        print(str(n) +" is a divisor of "+str(user_input))
    
