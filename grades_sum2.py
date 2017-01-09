def grades_sum(scores):
    count = 0
    for i in scores:
        count = count + i
    return count

def grades_average(grades):
    number = float(len(grades))
    avg = grades_sum(grades)/number
    return avg

def grades_variance(scores):
    average = grades_average(scores)
    variance = 0
    number = float(len(scores))
    for i in scores:
        variance += (average - i)**2
    total = variance/number
    return total

def grades_std_deviation(variance):
   final_output = grades_variance(variance)
   return final_output **0.5

print (grades_std_deviation([100, 100, 90, 40, 80, 100, 85, 70, 90, 65, 90, 85, 50.5]))
