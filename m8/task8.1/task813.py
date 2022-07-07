fname=input("Enter file name:\n")
fo = open(fname, "r")
read_data = fo.readlines()
for index in range(len(read_data)):
    if ((index+1) % 2) == 0:
        print("Even line:", read_data[index])