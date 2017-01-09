'''
Define a function which takes a list of integers as input and returns
the product of all the elements in the list.
i.e 4*5*5 = 100
'''
def product(sequence):
    #length = len(sequence)
    #new_sequence = sequence.split()
    p =1
    for i in sequence:
        p *=i
    return p

print(product([4,5,5]))
