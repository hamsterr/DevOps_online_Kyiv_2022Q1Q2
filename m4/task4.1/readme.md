### Linux Essentials  Task1.Part1
1. ![alt root login](/m4/task4.1/images/t1_1.PNG)
2.  Command passwd changes /etc/group and /etc/passwd
    ![alt root login](/m4/task4.1/images/t1_2.PNG)
3.  All registered users are written in /etc/passwd. In this file stored guid, uid, personal info (uid comments), home dir and default shell.
4.  
    ![alt root login](/m4/task4.1/images/t1_4.PNG)
5.  Get info from **man**
    + *useradd* username - creates user, by deafult without hom dir and password
    + *userdel* - remove user and it's home dir and mail file
    + *useradd* -m username - creates user and it's home dir
 
    ![alt root login](/m4/task4.1/images/t1_5.PNG)
6.  *More* and *less* - commands that helps with screen view of large files. *Less* - hams more options and function in *vi* -editor style
 Example:  cat .bash*  | less - view of all files that starts from .bash* one-by-one.
7. ![alt root login](/m4/task4.1/images/t1_7.PNG)
8. 
    ![alt root login](/m4/task4.1/images/t1_8.PNG)

    "drwxr-xr-x" - list of attributes, if first symbol *d*  it's a directory, if *-*  regular file.