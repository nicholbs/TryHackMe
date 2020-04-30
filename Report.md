Bolster defence through offence
===============================

**Author**: Nicholas Bodvin Sellevåg  
**Date**: submitted 01/05/2020  
**Version**: 1.0  





I would have gotten away with it if it wasn't for active directory!
-------------------------------------------------------------------
**Abstract**  

This report outline the weaknesses exposed on Radiobroadcast's network with Microsoft windows 2000 and XP computers.  
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
This report has the purpose of 
