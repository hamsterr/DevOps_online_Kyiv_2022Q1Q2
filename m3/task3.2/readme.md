1.
2. Net for Internet 30.4.88.0/24

  +  30.4.88.0/26
  +  30.4.88.64/26
  +  30.4.88.128/26
  +  30.4.88.192/26

3. 
 + Router ISP1 Ge0/0 - 10.88.20.1/24
 + Router ISP1 Ge1/0 - 30.4.88.66/26
 + Router ISP1 Ge2/0 - 30.4.88.129/26
 + Router ISP3 Ge0/0 - 4.20.88.1/24
 + Router ISP3 Ge2/0 - 30.4.88.130/26
 + Router ISP3 Ge3/0 - 30.4.88.193/26
 + Router ISP2 Ge0/0 - 30.4.88.1/26
 + Router ISP2 Ge1/0 - 30.4.88.65/26
 + Router ISP2 Ge3/0 - 30.4.88.194/26

4. Done

5.
![alt Enterprise  network](/m3/task3.2/images/4.PNG)

![alt DC  network](/m3/task3.2/images/4_1.PNG)

6. 
![alt DC  network](/m3/task3.2/images/6.PNG)

7. 
![alt DC  network](/m3/task3.2/images/7.PNG)

8. Whe we change subnet mask from 255.255.255.0 to  255.255.255.192. Servers in DATA Center become in different /26 subnets. Ping between them works, but as we see in tracert packets go trough  Router ISP3 Ge0/0 as deafult gateway.

![alt DC  network](/m3/task3.2/images/8.PNG)

9. ![alt DC  network](/m3/task3.2/images/9.PNG)

10.
   Servers in DATA Center now in different vlan, there is no Vlan sub interfaces on Router ISP3 Ge0/0.

    ![alt DC  network](/m3/task3.2/images/10.PNG)

12. ![alt DC  network](/m3/task3.2/images/12.PNG)
14. ![alt DC  network](/m3/task3.2/images/14-16.PNG)

