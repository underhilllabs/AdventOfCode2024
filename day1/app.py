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



