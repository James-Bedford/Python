def digit_sum(x):

    res = 0
    for i in str(x):
        res = res + int(i)

    return res
print(digit_sum(413))

# (digit_sum(12))
