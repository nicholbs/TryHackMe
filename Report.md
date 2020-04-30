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
  * 2.1 Current infrastructure and services
  * 2.1 Vulnerable systems
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
  
  
 1.Purpose of report  
--------------------
The report outlines how excessive user rights constitute foothold    
for attackers to exploit a windows infrastructure.  
Readers will alltogether learn the importance of exercising appropriate group policies for users.  
Furthermore the attackers methodology is bestoved focus on to demonstrate the mentality needed  
from administrator when implementing active directory domain services.  

Vulnerabilities explored in this report are all available in the metasploit framework.  
Moreover, Metasploit consists of scripts assembled together into a single framework.  
The framework serves as an ease of access tool to penetration test networks and proficiency in computer systems is not required.  
This report will only use tools obtainable through metasploit.  
With this in mind, one could argue that any user pose a security threat and should be given rights accordingly.  

2.Exploited application  
=======================  

2.1 Current infrastructure and services  
---------------------------------------  
The scenario consists of a radio streaming business.  
Remote listeners connects to a locally hosted web address, typically on a web browser.  
Local clients use the application Icecast for publishing their audio.  
It is notewhorty that Icecast does not produce audio, third party software is necessary.  
The third party software can be found on any operating system.  
Consequently exploiting Icecast affects all broadcasting users inside the domain.  
While the infrastructure reflects a medium sized business with active directory implemented.  
Size is not a determining factor for the radio business scenario.  
Future examples will represent the whole domain with only a client and domain controller.  




Reconnaissance 
Gaining access and escalating rights is done through buffer overflow and memory injection.  
Post modules leads to exposure of files and users.  
Access to password prohibited files is done with hash cracking tools.  
All exploits are available in the open source metasploit framework.  


 
  * 2.1 Vulnerable systems


