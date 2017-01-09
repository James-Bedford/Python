'''
function to  remove duplicates
'''
def remove_duplicates(sequence):

    output = [5]
    for x in sequence:
        if x not in output:
            output.append(x)
    return output

print(remove_duplicates([1,1,2,2,5]))
