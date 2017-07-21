#87% 1, 65% 2, 17% 3 10k draws
from random import randint
A=0
B=0

for trial in range(0,10000):
    if randint(1,100)<88:
        A= A+1
        
    else:
        B=B+1
for trial in range(0,10000):
    if randint(1,100) <66:
        A= A+1
    else:
        B=B+1
          
for trial in range(0,10000):
    if randint(1,1000) <17:
        A = A+1
    else:
        B = B+1        
#need to average result and present
def mean_result(a):
    result = (a)/3
    return result

print("The Result for A is {0}".format(mean_result(A)))
print("The Result for B is {0}".format(mean_result(B)))
