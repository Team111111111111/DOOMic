import numpy as np
import matplotlib.pyplot as plt
import numpy as np
import csv

plt.rcParams['figure.dpi'] = 500 
matrix = np.zeros((200,320))

data1 = np.array([])

with open("D:\\A.school\\Delft\\Y2\\EPO3\\DOOMIC\\DOOMic\\test\\raw.csv") as raw_data:
    data = csv.DictReader(raw_data)
    for row in data:
        data1 = np.append(data1, row)

data2 = np.array([])

for i in range(10, len(data1)):
    x = data1[i][None][0]
    if x.strip():
        inX = int(x, 16)
        if inX < 65534 and inX > 0:
            data2 = np.append(data2, inX)

print(data2)

f = open("demofile2.txt", "w")
for line in data2:
    f.write(str(line) + "\n")
f.close()
    
vector = np.vectorize(np.int_)
data3 = vector(data2)
y = data3//320
x = data3%320

xy = list(zip(x, y))
for x,y in xy:
    matrix[y,x] = 1
    
plt.style.use('bmh')
plt.xlim(0,319)
plt.ylim(0,199)    
plt.gca().invert_yaxis()
plt.imshow(matrix, cmap="binary")

plt.show()