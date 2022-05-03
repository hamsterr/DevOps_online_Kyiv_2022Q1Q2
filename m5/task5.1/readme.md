### Linux Networking  Task1 

| VM Name 	| Network        	|
|---------	|----------------	|
| Server1 	| 192.168.22.200 	|
| Net2    	| 10.88.20.0/24  	|
| Net3    	| 10.4.20.0/24   	|
| Net4    	| 172.16.20.0/24 	|

1. 

| Server1   Interface 	| Address        	|
|---------------------	|----------------	|
| Int1                	| 192.168.22.200 	|
| Int2                	| 10.88.20.1     	|
| Int3                	| 10.4.20.1      	|

  ![alt Server1 addressing](images/t5_1.png)


| Client1   Interface 	| Address        	|
|---------------------	|----------------	|
| Int1                	| 10.88.20.2     	|
| Int2                	| 172.16.20.0/24 	|

| Client2   Interface 	| Address        	|
|---------------------	|----------------	|
| Int1                	| 10.4.20.2      	|
| Int2                	| 172.16.20.0/24 	|


2.  
    ![alt dhcp](images/t5_2.png)
    ![alt dhcp](images/t5_2_1.png)

3.  ![alt trace](images/t5_3.png) 
 
    Client1 and Client2 are in different subnets and broadcast domains. But their is no routing and deafult gateway configured.
    ![alt trace](images/t5_3_1.png) 
4. 
   ![alt routing](images/t5_4.png) 