#Birthday
suppliers = {}
suppliers = {'National Grid': '5/24/19',
'TTF': '3/11/57',
'OEG': '4/1/41'}


if ('ODsG' in suppliers):
    print("Match")
else:
    print("No match")
    

print (suppliers.keys())
print(suppliers)


for suppliers_name in suppliers:
    print(suppliers_name,suppliers[suppliers_name])
