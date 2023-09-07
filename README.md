# CC-Create-Boiler-System

## About The Project
Lua project for create boiler system on Minecraft server.

The boiler system on the server has 8 tanks which are in made into 2 banks: 1-4 and 5-8.

Each tank has several data points for monitoring and control:
 - Lava Pump:
   - Electric Motor - Runs the 5 pumps pusing lava into the Liquid Blaze Burners
   - Rotational Speed Controller - Used for additional speed control beyond motor's speed
 - Lava Tanks:
   - Liquid Blaze Burner Inner - This blaze burner is connected directly to a pump and gets filled up first
   - Liquid Blaze Burner Output - This blaze burner is NOT connected direcrly to a pump and gets filled up last
 - Water Pump:
   - Electric Motor - Runs the 2 pumps pushing water into the boiler tanks
   - Rotational Speed Controller - Used for additional speed control beyond motor's speed
 - Boiler Status:
   - Display Link - Connects to individual tank and displays same boiler status as in game view

## BoilerBankData
Initial design is to have a program that runs on each bank's computer to broadcast this data per tank over rednet.
This will allow for additional development onto the pocket computer to monitor and control the boilers. Will need to think
of a way for this class to also control the devices so that the Control program does not need to know the direct devices being
controlled.

## BoilerBankDataMonitor
The computers will then also run a program to display the broadcasted information onto the monitors connected to the computer.
There are 2 sets of 3x3 monitors connected to each bank which will only be to show the data, not take user input.

## BoilerBankDataControl
A third program will also be running on the computers to give the users the ability to control the motors and RSCs as well as 
generate set points for Liquid Blaze Burner tanks. This will only be accessed through the computer itself since user input is
not the easiest to manage on the monitors.

These programs will be generated as individual classes with inputs to hook them to the necessary data that they need.
 - BoilerBankData needs the names of the devices being monitored and controlled.
 - BoilerBankDataMonitor needs to know which bank to connect to and gather data.
 - BoilerBankDataControl needs to know which bank to connect to for data gathering and setting.
