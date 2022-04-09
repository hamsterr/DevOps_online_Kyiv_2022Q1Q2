### Linux Essentials  Task1.Part1

1. ![alt root login](/m4/task4.1/images/t1_1.PNG)
2.  Command passwd changes /etc/group and /etc/passwd
    ![alt passwd](/m4/task4.1/images/t1_2.PNG)
3.  All registered users are written in /etc/passwd. In this file stored guid, uid, personal info (uid comments), home dir and default shell.
4.  
    ![alt personal info](/m4/task4.1/images/t1_4.PNG)
5.  Get info from **man**
    + *useradd* username - creates user, by deafult without hom dir and password
    + *userdel* - remove user and it's home dir and mail file
    + *useradd* -m username - creates user and it's home dir
 
    ![alt useradd](/m4/task4.1/images/t1_5.PNG)
6.  *More* and *less* - commands that helps with screen view of large files. *Less* - hams more options and function in *vi* -editor style
 Example:  cat .bash*  | less - view of all files that starts from .bash* one-by-one.
7. ![alt finger](/m4/task4.1/images/t1_7.PNG)
8. 
    ![alt ls -la](/m4/task4.1/images/t1_8.PNG)

    "drwxr-xr-x" - list of attributes, if first symbol *d*  it's a directory, if *-*  regular file.

### Linux Essentials  Task1.Part2

1. On screenshot usage of tree command with patterns, shows only files that contains in name "core ore header".
    <pre> tree -L 2 -P '*core*|*header*' | less</pre>
    ![alt tree](/m4/task4.1/images/t12_1.PNG)
2. ![alt file](/m4/task4.1/images/t12_2.PNG)
3. *cd ~* or *cd $HOME*
4. ls -l - list of files and dirs in directory
   ls -la - list of files and dirs in directory and their attributes, including hidden.
5. ![alt mkdir](/m4/task4.1/images/t12_5.PNG)
6.  + then delete the labwork2. What changes have occurred and why?
    soft link became empty, but hard link still has a copy of file
    ![alt links](/m4/task4.1/images/t12_6.PNG)

7. 
    ![alt locate](/m4/task4.1/images/t12_7.PNG)
8. ![alt df](/m4/task4.1/images/t12_8.PNG)
9. Utility *wc* is used to count words and lines in file.
    ![alt wc](/m4/task4.1/images/t12_9.PNG)
10. ![alt find](/m4/task4.1/images/t12_10.PNG)
11.     
    + find /etc/ -name "*ss*"
    + ls /etc/ | grep ss
12. ls /etc | more
13.  device types: character, block, pipe, socket
    File types in Linux:
      + Regular  files
      + Directory  files
      + Special files: devices, links etc.
14. Command which gets file type **file**
15.  ![alt ls -1t](/m4/task4.1/images/t12_15.PNG)
