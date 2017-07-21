#Ask user for  an imput and only break if Q/q entered.
while True:
    user_input = input("Please enter a char: ")
    if(user_input=="Q" or user_input=="q"):
        break
        print("finished")
