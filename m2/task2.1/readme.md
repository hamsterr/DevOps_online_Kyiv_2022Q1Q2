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

    1.4 ![alt Create VM1](/m2/task2.1/images/1_4.png)
