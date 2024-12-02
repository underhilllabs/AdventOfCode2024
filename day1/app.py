# fname = "test.txt"
fname = "input.txt"
file = open(fname)
col1 = []
col2 = []
for line in file.readlines():
    c1, c2 = line.split()
    print(f"got {int(c1)} {int(c2)}")
    col1.append(int(c1))
    col2.append(int(c2))

col1.sort()
col2.sort()

total = 0
for idx in range(len(col1)):
    a = col1[idx]
    b = col2[idx]
    if (a > b):
        sum = a - b
    else:
        sum = b -a     
    total += sum

print(f"Question 1: sum is {total}")

total_scores = 0
for num1 in col1:
    count = 0
    for num2 in col2:
        if num2 == num1:
            count += 1
    sim_score = count * num1
    total_scores += sim_score

print(f"Question 2: sum {total_scores}")



