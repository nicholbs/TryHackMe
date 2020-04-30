Pentesting microsoft domain with excessive user rights
======================================================

**Author**: Nicholas Bodvin Sellevåg  
**Date**: submitted 01/05/2020  
**Version**: 1.0  






Misimplementation of active directory domain services
-------------------------------------------------------------------
**Abstract**  

This report outlines weaknesses exposed in excessive user rights on a windows 2000 computer, and subsequently the lack of active directory domain services configuration.  
Remote attacker was enabled access through ethernalBlue, buffer overflow attack and lack of security configurations.  
Means and meassures of attacks and procedures for recovery are described in details.   



**Table of Contents**  
* 1.Purpose of report  
* 2.Exploited application  
  * 2.1 Vulnerable systems
  * 2.1 Current infrastructure and services
* 3.Attack  
  * 3.1 Recon/Auxilliary  
    * 3.1.1 Nmap
  * 3.2 Gain Access  
    * 3.2.1 Buffer overflow
    * 3.2.2 Reverse TCP /gaining shell
  * 3.3 Escalate  
    * 3.3.1 meterpreter
  * 3.4 Cracking the hash  
    * 3.4.1 Brute force / John the ripper
  * 3.5 Looting  
    * 3.5.1 lack of security configurations
    * 3.5.2 Exposing users / Minikatz (Kiwi) creds all
  * 3.6 Post-Exploitation  
    * 3.6.1 hashdump, screenshare, record mic, golden ticket
* 4.Recovery procedures
  * 4.1 Being rooted
  * 4.2 Policy
  * 4.3 Identify the problem
  * 4.4 Recover control
* 4.Defending 
  * 4.1 What we learned
  * 4.2 Prospects of active directory
  
  
1. Purpose of report  
--------------------
The report outlines how excessive user rights constitute foothold    
for attackers to exploit a windows infrastructure.  
Readers will alltogether learn the importance of exercising appropriate group policies for users.  
Furthermore the attackers methodology is bestoved focus on to demonstrate the mentality needed  
from administrator when implementing active directory domain services.


mentality
the mindset which future implementations of active directory  
domain services should be created form. 
demonstrated through  
a user which 

bestoved focus on recovery and 


Attacker is enabled access 
Attack methododology is detailed 

To conclude, 

excersice appropriate policies 

right 

enabled to 

through learning the


footing  
Footing for 

an attacker gains ground on 
