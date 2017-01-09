'''
def censor(word,replace):
    word_split = word.split()
    replace_dict= ''
    counter=0
    for i in word_split:
       counter +=1
       if i == replace:
           replace_dict +='*' * len(i)
           if counter != len(word_split):
               replace_dict +=' '
       else:
            replace_dict +=i
            if counter != len(i):
                replace_dict +=' '
    return replace_dict
'''
def censor(text,word):
    length = len(word)
    newlist = text.split()
    phrase = ""
    for term in newlist:
        if term == word:
            term = "*" * length
            phrase += term + " "
        else:
            phrase += term + " "
    return phrase[:-1]


print(censor("this hack is wack hack","hack")),
#print(censor("hey hey hey","hey")),
