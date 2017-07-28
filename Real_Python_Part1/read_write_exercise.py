'''
read_File = open("test_text.txt","r")

for n in read_File.readlines():
    print(n),
read_File.close()
'''
'''
with open("test_text.txt","r") as read_File:
    for n in read_File.readlines():
        print(n),
'''

with open("test_text.txt","r") as read_File, open("test_text_dump.txt","w") as dump_Output:
    for n in read_File.readlines():
        dump_Output.write(n)

text_To_Add = "\nAn extra line added"
with open("test_text.txt","a") as write_File:
    write_File.writelines(text_To_Add)
    
    
