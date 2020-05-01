Pentesting microsoft domain with excessive user rights
======================================================

**Author**: Nicholas Bodvin Sellevåg  
**Date**: submitted 01/05/2020  
**Version**: 1.0  


Misimplementation of active directory domain services
-------------------------------------------------------------------
**Abstract**  

This report outlines weaknesses exposed in excessive user rights on a windows 2000 computer, and subsequently the lack of active directory domain services configuration.  
Remote attacker was enabled access through buffer overflow and lack of security configurations.  
Means and meassures of attacks and procedures for recovery are described in details.   


**Table of Contents**  
1. Purpose of report  
2. Exploited application  
  2.1 Current infrastructure and services
  2.1 Buffer overflow and in-memory attack  
3.  Attack  
    3.1 Recon/Auxilliary  
    3.1 Nmap
  3.2 Gain Access  
    3.2 Buffer overflow  
    3.2 Reverse TCP /gaining shell  
  3.3 Escalate  
    3.3 meterpreter  
  3.4 Cracking the hash  
    3.4 Brute force / John the ripper  
  3.5 Looting  
    3.5 lack of security configurations  
    3.5 Exposing users / Minikatz (Kiwi) creds all  
  3.6 Post-Exploitation  
    3.6 hashdump, screenshare, record mic, golden ticket  
4.Recovery procedures  
  4.1 Being rooted  
  4.2 Policy  
  4.3 Identify the problem  
  4.4 Recover control  
5.Defending  
  5.1 What we learned  
  5.2 Prospects of active directory  
  
  
 1.Purpose of report  
--------------------
The report outlines how excessive user rights constitute foothold    
for attackers to exploit a windows infrastructure.  
Readers will alltogether learn the importance of exercising appropriate group policies for users.  
Furthermore the attackers methodology is bestoved focus to demonstrate the mentality needed  
from administrator when implementing security systems in their network.  

Exploits explored in this report are all available in the metasploit framework.  
Moreover, Metasploit consists of scripts assembled together into a single framework.  
The framework serves as an ease of access tool for penetration testing networks, proficiency in computer systems is not required.  
This report will only use tools obtainable through metasploit.  
With this in mind, one could argue that any user pose a security threat and should be given rights accordingly.  

2.Exploited application  
=======================  

2.1 Current infrastructure and services  
---------------------------------------  
The scenario consists of a radio streaming business.  
Local clients use the application Icecast for publishing their audio online.
Remote listeners connects to locally hosted web addresses, typically on a web browser.
Icecast can be applied to most unix and windows opperating systems, and it is notewhorty that the application does not produce audio.  
  
Third party software is necessary to feed sound into Icecast.  
Supplementary audio software is accessible on any operating system.  
Consequently exploiting Icecast affects all broadcasters in our scenario, there are no limitations based on operating systems.  

The infrastructure itself reflects a medium sized business in size, and has implemented their domain with active directory domain services.  
It is notewhorty that neither size or type of computer is a determining factor for this scenario seing as any client or server running Icecast is affected.  
For ease of concept, future examples will represent the whole domain with only a single client and domain controller.  

 2.1 Buffer overflow and in-memory attack
 ----------------------------------------
Specifically, Icecast version 2.0.1 and earlier installements are vulnerable to buffer overflow.  
Buffer overflow is a central concept to avoid when creating sturdy and reliable code.
Programs that run without proper measurements to overflowing buffers can lead to the exploits this report entails.
In other words, explaining buffer overflow is vital for the report and leading pharagraps will make an attempt at it. 
After all, understanding the problem is essential before applying solutions.  

>"No problem can be solved from the same level of consciousness that created it." -Albert Einstein  

Imagine pouring yourself a glass of water, naturally there is a limit without leaking.  
Then pour some additional water and the glass overflows.  
In the same manor some programs without proper boundaries can overflow buffers.  
Buffers are an allocated memory block of specified lenght.  
Superceeding the manageable amount of data results in the extra data overwriting critical values. 

To fully understand the concept of buffer overflow, three aspects are necessary:
1. Usage of buffers in coding
2. Memory addresses spaces.
3. Leak in memory

*Usage of buffers in coding*  
The regularity of buffer overflow differ from programming languages.  
Programs written in C is often associated with buffer overflow.  
For example, games are often developed with C as it can offers faster compiling time and execution.  
Furthermore values on security and reliability in such environments are often sacrificed for speed.  
Input from users is gathered with functions such as scanf, gets and strcpy.  
Absence of appropriate boundary checking when receiving input can result in buffer overflow.  

In fact every program that asks for credentials have a similar input function.  
Behind the scenes a user can be expected to input their name with 20 characters.  
Write "John Smith" and the boundaries are met.  
Write "John Smithhhhhhhhhhhhhhhhh" and suddenly the buffer has overflown and all extra "h" will affect the next memory address.

*Memory address spaces*  
Programs are given access to memory during runtime and becomes a process.  
The memory can be viewed as blocks, within are address spaces stacked together to form the block.  
<img src="https://github.com/nicholbs/TryHackMe/blob/master/Pictures/Allocated%20memory.PNG" width="400" height="230">  

Essentially, code is compiled from human programming language into machine code and mapped into each address space.  
<img src="https://github.com/nicholbs/TryHackMe/blob/master/Pictures/Address%20space.PNG" width="400" height="230">  

Processes load addresses to serve a function inside the program.  

Concepts of shared library is out of scope for this report.  
Some memory is only accessible for a designated part of a program, others can be dynamically linked.  
Dynamic link libraries and Executables are out of scope for this report.

*Leak in memory*  
While Dynamic Link Libraries and Executables are out of scope for this report.  
The concept of using buffer overflow as a means of attack stems from memory used in different processes.  
For example the program Icecast can share a part of memory which another program uses.  
Overwriting the code inside that address space results in new code being loaded in other processes.  
Ultimately, overwriting could lead to processes loading code which opens powershell and execute cmdlets.  
To conclude, memory adresses spaces are assigned to a process and contains code to be loaded and run by programs.





