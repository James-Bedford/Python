'''
Function that takes in a list of numbers and removes the odd numbers
if number is not divisible by two then its odd
'''
import math
def purify(sequence):
    new_list = []
    #for item in sequence:
    #    new_list.append(item)
    for i in sequence:
        if i%2==0:
            new_list.append(i)
    return new_list

print(purify([4,5,5,4]))
