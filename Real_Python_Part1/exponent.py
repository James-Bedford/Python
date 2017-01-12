'''
receives two numbers from the user and displays
the result of taking the first number to the power of the second number.
'''
base_input = input("Enter a base: ")
power_input = input("Enter a power: ")
output = float(base_input) ** int(power_input)
print("{0} to the power of {1} = {2}".format(base_input,power_input,output))
print(str(output))
