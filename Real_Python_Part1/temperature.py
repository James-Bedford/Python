#Temperature coversion
def celsius(a):
    "converts celsius to fahrenheit"
    output = (a*9/5) +32
    return output

def fahrenheit(a):
    "converts Fahrneheit to celsius"
    output = (a-32)*5/9
    return output

user_one = input("Celsius to convert")
user_two = input("Fahrenheit to convert")

output_one = fahrenheit(float(user_one))
output_two = celsius(float(user_two))

print("user_one F = " + str(output_one)+"degrees C")
print("user_two C = " + str(output_two)+"degrees F")


