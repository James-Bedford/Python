def cube(a):
    "Cube cubes a users number"
    output = a*a
    return output

user_input = input("Number to cube?")
user_output = cube(int(user_input))
print(str(user_output))
