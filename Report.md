Bolster defence through offence
===============================

**Author**: Nicholas Bodvin Sellevåg  
**Date**: submitted 01/05/2020  
**Version**: 1.0  





I would have gotten away with it if it wasn't for active directory!
-------------------------------------------------------------------
**Abstract**  

This report outline the weaknesses exposed on Radiobroadcast's network with windows XP computers.  
Remote attacker was enabled access through ethernalBlue, buffer overflow attack and lack of security configurations.  
Means and meassures of attacks and procedures for incident handling are described in details.  

**Table of Contents**  
* 1.Purpose of report  
* 2.Radiobroadcast network  
  * 2.1 Current infrastructure
  * 2.2 Services provided
  * 2.3 future 
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
* 4.Next  
