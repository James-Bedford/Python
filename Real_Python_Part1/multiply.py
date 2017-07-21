def multiply(a,b):
    "multiply, multiplies two numbers"
    output = a*b
    return output

user_input_one = input("First number to x")
user_input_two = input("Second number to x")
user_output  = multiply(int(user_input_one),int(user_input_two))
print (str(user_output))
       
