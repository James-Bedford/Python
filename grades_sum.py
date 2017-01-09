def grades_sum(scores):
    count = 0
    for i in scores:
        count = count + i
    return count

def grades_avaerage(grades):
    number = float(len(grades))
    avg = grades_sum(scores)/number
    return avg

print (grades_sum([100, 100, 90, 40, 80, 100, 85, 70, 90, 65, 90, 85, 50.5]))
