'''
cannot use statistics import in code academy versionso alternative
'''
def median(lists):
    lists.sort()
    if len(lists)% 2 == 0:
        middle = len(lists)/ 2
        middley = middle - 1
        median = (lists[middle] + lists[middley])/ 2
    else:
        middle = len(lists)/2
        median =  lists[middle]
    return median

print (median([4,5,5,4]))
