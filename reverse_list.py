def reverse_list(x):

    new_word = ""
    for i in range(1,len(x)+1):
        new_word = new_word + x[-i]
        i +=1
    return new_word
        #forward_list.append(i)
        #item = len(forward_list)
        #item-=1
        # item >= 0:
#reverse_list.insert(a,forward_list[item])
        #    item -=1
#a+=1
    #return reverse_list
print(reverse_list("Python!"))
