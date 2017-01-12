'''
script asks for soem text and then
translates into
"leetspeak" by making the following changes to lower-case letters:
The letter: a becomes: 4
The letter: b becomes: 8
The letter: e becomes: 3
The letter: l becomes: 1
The letter: o becomes: 0
The letter: s becomes: 5
The letter: t becomes: 7
'''
my_string = input("Enter some text: ")
my_string = my_string.replace("a",str(4))
my_string = my_string.replace("b",str(8))
my_string = my_string.replace("e",str(3))
my_string = my_string.replace("i",str(1))
my_string = my_string.replace("o",str(0))
my_string = my_string.replace("s",str(5))
my_string = my_string.replace("t",str(7))

print(my_string)
