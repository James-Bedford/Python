def anti_vowel(text):
    new_word = ""
    for i in range(0,len(text)):
        if text[i] in ("A","a","E","e","I","i","O","o","U","u"):
            text.strip('A')
            text.strip('a')
            text.strip('E')
            text.strip('e')
            text.strip('I')
            text.strip('i')
            text.strip('O')
            text.strip('o')
            text.strip('U')
            text.strip('u')
        else:
            new_word = new_word + text[i]
            #print (i),
            #print (text[i]),
        i +=1
    return new_word

print(anti_vowel("Hey You!"))
