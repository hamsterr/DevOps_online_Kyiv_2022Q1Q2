import platform,psutil

def get_size(bytes, suffix="B"):
    devider = 1024
    for unit in ["", "K", "M", "G", "T", "P"]:
        if bytes < devider:
            return f"{bytes:.2f}{unit}{suffix}"
        bytes /= devider
my_system = platform.uname()

print(f"System: {my_system.system}")
print(f"PC Name: {my_system.node}")
print(f"Release: {my_system.release}")
print(f"Version: {my_system.version}")
print(f"Machine: {my_system.machine}")
print(f"Processor: {my_system.processor}")
print("Physical cpu cores:", psutil.cpu_count(logical=False))
print("Total cpu cores:", psutil.cpu_count(logical=True))
memory = psutil.virtual_memory()
print(f"RAM: {get_size(memory.total)}")
print(f"RAM:", psutil.disk_partitions())