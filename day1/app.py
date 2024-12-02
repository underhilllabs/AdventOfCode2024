fname = "input.txt"
file = open(fname)
col1 = []
col2 = []
for line in file.readlines():
    c1, c2 = line.split()
    print(f"got {int(c1)} {int(c2)}")
    col1.append(int(c1))
    col2.append(int(c2))

sorted_col1 = sorted(col1)
sorted_col2 = sorted(col2)

total = 0
for idx in range(len(sorted_col1)):
    a = sorted_col1[idx]
    b = sorted_col2[idx]
    if (a > b):
        sum = a - b
    else:
        sum = b -a     
    total += sum

print( "sum is %d " % total)