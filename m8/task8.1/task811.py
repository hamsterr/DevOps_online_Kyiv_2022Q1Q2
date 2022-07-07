from datetime import datetime, tzinfo
now = datetime.now()
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
print("Current date and time =", dt_string)