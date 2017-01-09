'''
Write a function called median that takes a list as an input
 and returns the median value of the list.

For example: median([1,1,2]) should return 1.

    The list can be of any size and the numbers are not guaranteed
    to be in any particular order.
    If the list contains an even number of elements, your function
    should return the average of the middle two.
'''
import statistics
def median(sequence):
    output = []
    sequence.sort()

    #output = median(sequence)
    #for i in sequence:

    output = statistics.median(sequence)
    return output

print(median([2,4,1,3]))
