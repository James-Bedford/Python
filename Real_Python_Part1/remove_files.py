#remove all jpeg files over 490 kb
#in images files


import shutil,os

directory_Path = "C:/Users/jbedford/Gazprom/Win_Python/WinPython-64bit-3.5.3.1Qt5/notebooks/work/Refresh/images/"
file_Name_List = os.listdir(directory_Path) # lists files

for n in file_Name_List:
    if n.lower().endswith(".jpg"):
        file_Size = os.path.getsize(directory_Path+n)
        #print("File {0} is {1} bytes long".format(n,file_Size))
        if (file_Size>40000):
            print("File {0} is {1} bytes long".format(n,file_Size))
            print ("Deleting large files")
            os.unlink(directory_Path+n)
            
    
