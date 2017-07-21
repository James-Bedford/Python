#open file search for test and then print out result#

import re

'''
with open("/tmp/LostShots/LostShots.txt", "r") as input_file:
    with open('results.txt', 'w') as output_file:

        for line in input_file:
            if "Lost" in line:
                output_file.write(line)
                '''
#with open("C:/Users/jbedford/Gazprom/Win_Python/WinPython-64bit-3.5.3.1Qt5/notebooks/work/Refresh/search_text.py/german.txt","r") as input_file:
with open("german.txt") as input_file:
    with open ('results.txt','w') as output_file:

        for line in input_file:
            #if "2017" in line:
            if re.match("(.*)(T|t)otal(.*)",line):

                
                output_file.write(line)
                
