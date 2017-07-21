#Print double quotes

print('"" double quotes ""')
print ("Test's")
print("I'm \n on \n three lines")
print("Here's a string that I want to write across multiple lines since it is long.")
string_length=len("Here's a string that I want to write across multiple lines since it is long.")
print(string_length)
string_sentence = "Here's a string that I want to write across multiple lines since it is long."
print(string_sentence[46],string_sentence[12])

i= 0 
while i <string_length:
    print (string_sentence[i])
    i =i+1
    
string_one = "Good"
string_two = "Morning"
print (string_one + string_two)
print (string_one + "," + string_two)

string_bazinga = "bazinga"
print(string_bazinga[2],string_bazinga[3],string_bazinga[4],string_bazinga[5])

print(string_bazinga.upper())

user_input = input("Press a Key")
print("You pressed " +user_input)
string_upper=("TEST THIS OUT")
print(string_upper.lower())

print("{}".format(string_bazinga))


weight = 0.2
animal = "newt"
print(str(weight) + " is the weight of the "+animal)
print("{} is the weight of the {}".format(weight,animal))
#using indexes
print("{0} is the weight of the {1}".format(animal,weight))


phrase = "The surpris eis in here somwhere"
print(phrase.find("in"))
my_story = "It all started one day in"
print(my_story.replace("started","ended"))






