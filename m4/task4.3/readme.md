## Module 4 Linux Essentials  
### Task4.3
1. It is 5 types of process state in linux:
    Running or Runnable (R)
    ninterruptible Sleep (D)
    Interruptable Sleep (S)
    Stopped (T)
    Zombie (Z)
2. 
    ![alt pstree](images/t3_2.png)

3. Proc file system is virtual file system which contains information about currently runnig  processes. It is created at boot and destroyed when system shuts down.

   ![alt proc ls](images/t3_3.png)

4. 
   ![alt cpuinfo](images/t3_4.png)

5. 
    ![alt ps](images/t3_5.png)

6. Name of kernel processes is in square brackets. It is list of instructions  that can be managed by OS Kernel only.
  
    ![alt kernel proc](images/t3_6.png)

    Other is a user space process.
7.  In ps utility it is *STAT* fiels which shown state of process, for example **S** - sleaping state and **R** - running ir runable, **Z** - will mean *zombie* process.

    ![alt states](images/t3_7.png)

8.  Current user processes

    ![alt user proces](images/t3_8.png)

9.  pgrep,pstree,top,proc.

10. Top command displays information of Linux process and system resources usage in realtime.

11. ![alt top by user](images/t3_11.png)

12. Top interactive command
    Shift + Z - select color to display
    Shift + P - sort by CPU usage
    ![alt top interactive](images/t3_12.png)

13. Screenshot displays chnaged color and sorted output by CPU time usage.

    ![alt top interactive](images/t3_13.png)
14. **Priority** - decimal value which is used by Linux kernel to schedule running process, higher value means that process have more priority in CPU queue. There is 2 columns in top utility **PR** - priority of process and **NI** - user-spave value (from -20 to 19) which help to control and modify process priority. 
   *nice -n nice_val [command]* - command to run process with some nice value;
   *renice -n nice_val -p [pid]* - command to modify nice value if running process.
15. By pressing *r* in top command we can change priority of process.
    ![alt top renice](images/t3_15.png)

16. **kill -signal pid** - command which sends some stop signal to process. Typical signals: *SIGTERM* - sends terminate request to process, used by deafult in kill command
*SIGKILL* - terminates process and child processes immediately 
*SIGSTOP* - stops process execution untill SIGCONT will be sent.
17. 
    + **jobs** - shows list of running tasks
    + **fg [task number]** - moves task from background to foreground
    + **bg [task number]** -  moves task from foreground to background

    ![alt top interactive](images/t3_17.png)

### Linux Essentials  Task3 Part2

1.  ![alt ssh-keygen](images/t3_p2_1_1.png)

     ![alt ssh](images/t3_p2_1_2.png)

     ![alt ssh](images/t3_p2_1_3.png)

    Most of frequently used OPENSSH commands work on MS Windows 10. I found one utility that not works it is ssh-copy-id so i decide to use alternate shell command as displayed on screenshot 3.

2. We can modify default ssh server settings to improve security of connection. Config file to edit this **/etc/ssh/sshd_config**.
   **PermitRootLogin no** - disables ssh connectiob by root user
   **Port 4444** - change default 22 port to listen connection
3.  + **RSA** 
       ![alt rsa](images/t3_p2_3_1.png)

    + **DSA**
       ![alt dsa](images/t3_p2_3_2.png)

    + **ECDSA**
       ![alt ecdsa](images/t3_p2_3_3.png)

4.  ![alt port fw nat](images/t3_p2_3_4.png)

     ![alt port fw nat](images/t3_p2_3_4.png)
     
     




    