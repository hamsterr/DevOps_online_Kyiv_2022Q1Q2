import emoji
Text = input("Enter text:\n").split(" ")
result = ""
for word in Text:
    if word == ":)":
        word = ":grinning_face:"
        result += word + " "
    elif word == ":(":
        word = ":frowning_face:"
        result += word + " "
    else:
        result += word + " "
print(emoji.emojize(result))