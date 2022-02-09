# **Part1. Hypervisors**
1. Most of the big players in the virtualization market offer products for desktop users and for enterprises. The top of most popular hypervisors is VMware VSphere/ ESXi/ Workstation, Microsoft  Hyper-V, Xen / Citrix XenServer, Oracle VM Virtualbox, QEMU, KVM, etc.

2. We can identify two main types of hypervisors. Type 1 - embedded hypervisor runs directly on the system hardware. Type 2 runs in a host operating system that provides virtualization services, such as I/O device support and memory management. But virtualization technology has a different type of classification. So we will describe the main difference between top hypervisors:
    + **Paravirtualization** is a technology that has minimal overhead and is mostly identical to “bare metal” OS access to hardware. But it is needed to apply kernel modification into guest OS. The main representatives is Xen and Hyper-V. From my own experience with hyper-v, the most painful problem was the impossibility to bypass USB ports into guest OS.
    + **Full virtualization** - execution of the guest OS  instructions are isolated and translated by the hypervisor. This technique allows running wide types and different versions of guest operating systems with different hardware emulation. Befits is portability and compatibility but the price is a big overhead. Oracle Virtualbox, Linux Qemu represents full virtualization. 
# **Part2. Work with VirtualBox**
1. Run VirtualBox and VM

    1.1 done

    1.2 ![alt install VirtualBox on Fedora33](/m2/task2.1/images/1_2.png)

    1.3 ![alt Download latest Ubuntu](/m2/task2.1/images/1_3.png)

    1.4 
    ![alt Create VM1](/m2/task2.1/images/1_4.png)

    1.5 Got acquainted with possibilities of VM1 control
    ![alt Create VM1](/m2/task2.1/images/1_5_1.png)
    ![alt Create VM1](/m2/task2.1/images/1_5_2.png)
    ![alt Create VM1](/m2/task2.1/images/1_5_3.png)

    1.6

    ![alt Create VM1 clone VM2](/m2/task2.1/images/1_6.png)

    1.7 

    ![alt Create group of  VM1, VM2](/m2/task2.1/images/1_7.png)

    1.8 Snaphot4 in poweredoff state and than started in Headless mode

     ![alt Create group of  VM1, VM2](/m2/task2.1/images/1_8.png)

    1.9 
    + Export
    ![alt Export  VM2](/m2/task2.1/images/1.9.png)
    + Import
    ![alt Import VM2](/m2/task2.1/images/1_9_1.png)
2. Configuration of VMs

    2.1 Done

    2.2 

    ![alt Connect USB](/m2/task2.1/images/2_2.png)

    2.3 Installed Guest Additions
  
    ![alt Added shared folder](/m2/task2.1/images/2_3_1.png)

    ![alt Check shared folder](/m2/task2.1/images/2_3_2.png)

    2.4  ![alt Test network modes](/m2/task2.1/images/Vboxnet.png)

    +  Test NAT modes and portforward

        ![alt Test network modes](/m2/task2.1/images/2_4_1.png)

        ![alt Test network modes](/m2/task2.1/images/2_4_2.png)

        ![alt Test network modes](/m2/task2.1/images/2_4_3.png)

    + Dchp server settings and hostonly nad internal net modes

        ![alt hostonly settings](/m2/task2.1/images/2_4_4.png)

        ![alt Dchp server settings](/m2/task2.1/images/2_4_5.png)
    
3. Work with CLI through VboxManage 
    
    3.1 I am running Linux CLI.
    
    3.2 VBoxManage basic commands
     
    ![alt list vms](/m2/task2.1/images/2_5_1.png)

    ![alt createvm](/m2/task2.1/images/2_5_2.png)

    ![alt controlvm](/m2/task2.1/images/2_5_3.png)

    ![alt startvm](/m2/task2.1/images/2_5_4.png)

    After executing commabd *VBoxManage clonevm* it's needed to register cloned machine

    ![alt registervm](/m2/task2.1/images/2_5_5.png)
# **Part3. Work with vagrant**

 1. dnf install vagrant

 2. ![alt mkdir vagrant_test](/m2/task2.1/images/3.2.png)

 3. ![alt vagrant init](/m2/task2.1/images/3.3.png)

 4. ![alt vagrant init](/m2/task2.1/images/3.4.png)

 5. ![alt ssh vagrant machine](/m2/task2.1/images/3.5.png)

 6. ![alt date](/m2/task2.1/images/3.6.png)

 7. ![alt stop and delete vagrant machine](/m2/task2.1/images/3.7.png)

 8. ![alt stop and delete vagrant machine](/m2/task2.1/images/3.8.png)
 
 9. Added m2/task2.1/Vagrantfile which allows to up 2 Ubuntu 20.04 machines one is clean and second with nginx installed.
 
   ![alt stop and delete vagrant machine](/m2/task2.1/images/3.9.png)
   



