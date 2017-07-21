try:
    user_input= int(input("Please enter an integer"))
    result = (user_input/1)
    print("You entered and this, "+str(user_input)+"  Integer")
except ValueError:
    print("No Integer entered")


