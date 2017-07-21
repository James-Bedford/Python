from random import randint
#{A/An} {adjective1} {noun1}
#{A/An} {adjective1} {noun1} {verb1} {preposition1} the {adjective2} {noun2}
#{adverb1}, the {noun1} {verb2}
#the {noun2} {verb3} {preposition2} a {adjective3} {noun3}
#Use format string method!
#Bonus: Make sure that the "A" in the title and the first line is adjusted to become an
#"An" automatically if the first adjective begins with a vowel.

list_Nouns = [ "fossil","aardvark", "judge", "chef", "mango", "extrovert","gorilla"]
list_Verbs = ["kicks", "jingles", "bounces", "slurps", "meows", "explodes"]
list_Adjective = ["furry", "balding", "incredulous", "fragrant", "exuberant", "glistening"]
list_Prepos =["against", "after", "into", "beneath", "upon", "for", "in", "over","thin"]
list_Adv = ["curiously", "extravagantly", "tantalizingly", "furiously", "sensuously"]

#Build function library
def adjective():
    n = randint(1,len(list_Adjective))
    adjective_Word = list_Adjective[n-1]
    return adjective_Word

def noun():
    n = randint(1,len(list_Nouns))
    noun_Word = list_Nouns[n-1]
    return noun_Word

def verb():
    n = randint(1,len(list_Verbs))
    verb_Word = list_Verbs[n-1]
    return verb_Word

def proposition():
    n = randint(1,len(list_Prepos))
    prop_Word = list_Prepos[n-1]
    return prop_Word


title_Adjective = adjective()
title_Noun = noun()
#take first letter of title_noun if vowel chang 'A' to 'An'
first_Letter = title_Adjective[0]
if (first_Letter =="a" or first_Letter =="e" or first_Letter =="i" or first_Letter =="o" or first_Letter=="u"):
    start= "An"
else:
    start = "A"
print("{0} {1} {2}".format(start,title_Adjective,title_Noun))
print("{0} {1} {2} {3} {4}".format(start,title_Adjective,title_Noun,verb(),proposition()))






