import re
fname=input("Enter html file name:\n")
fo = open(fname, "r")
html = fo.read()
match = re.search('<title>(.*?)</title>', html)
title = match.group(1) if match else 'No title'
print("Title is: ", title)