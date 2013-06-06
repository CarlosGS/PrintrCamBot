PrintrCamBot v0.1  
============

An open-source 3D-printable **Dropcam carrier for Printrbot's challenge.**  

![ScreenShot](https://github.com/carlosgs/PrintrCamBot/raw/master/Media/robot.JPG)

Summary  
--
My name is Carlos García Saura, and I'm a student from Spain. **I am a true fan of Printrbot, and I also love making robots, so you can imagine my face when I saw this:**  

![ScreenShot](https://github.com/carlosgs/PrintrCamBot/raw/master/Media/Challenge/Tweet.png)

Basically, my approach is based on two different ideas:  

- **Since the Dropcam has two-way audio incorporated, why not use that to send DTMF audio tones to control the robot? (more details below)**  
- **A "flying fox" robot could easily travel around Printrbot's warehouse without disturbing their workspace** You would just need to place a tense wire from one side to the other of the place to monitor.  

**Dear Brook (@Printrbot), please let me know your thoughts regarding these concepts. I know the DTMF solution may sound too simple, but trust me - it works. I have kept the costs as low as possible. Finally, I would love to see this robot moving around Printrbot's HQ**  

Video  
--
For this test, I fixed my Android Phone to the back of the robot, and added a heavy battery on the other side as a weight to stabilize the robot.
The additional weight plus the thin wire that I have used make the robot quite unstable (it is the first test, what did you expect? ;)  

I have then stabilished a call via Skype (for the DropCam, this will be done pressing the "Talk" button, and then using a DTMF generator on any smartphone, holding it next to the mic).  

The dial-up tones coming out from the speaker of the smartphone -I insist, this could be directly the Dropcam- are then interpreted by the DTMF decoder + Arduino Nano to move the servos.

[![ScreenShot](https://raw.github.com/GabLeRoux/WebMole/master/ressources/WebMole_Youtube_Video.png)](http://youtu.be/sOZ26wGzT1U)

**Unfortunately, I don't have a Dropcam to do proper tests. But as it is shown in the video, this robot can control a Dropcam via internet using its speaker.**

Details  
--
I have printed all the parts using my Printrbot Jr, which I bought last summer. **This printer feels very lonely and would love to have a Printrbot Simple as a friend :)**  
![ScreenShot](https://github.com/carlosgs/PrintrCamBot/raw/master/Media/Previous/2013-06-03 19.48.16.jpg)
The parts have been designed with OpenScad and are parametric, don't forget to add the real diameter of the Dropcam before printing!  

For the electronics, I have developed a DTMF decoder board and manufactured it in **Cyclone PCB Factory** (<https://github.com/carlosgs/Cyclone-PCB-Factory>). **It has been the first circuit manufactured with this new open-hardware machine! :P**  
If Printrbot likes my idea, I will send them the electronics assembled so they don't need to worry about it.

![ScreenShot](https://github.com/carlosgs/PrintrCamBot/raw/master/Electronics/DTMF-Decoder/ManufactureProcess/2013-06-04%2021.59.21.jpg)

![ScreenShot](https://github.com/carlosgs/PrintrCamBot/raw/master/Electronics/DTMF-Decoder/ManufactureProcess/2013-06-05%2017.26.01.jpg)

![ScreenShot](https://github.com/carlosgs/PrintrCamBot/raw/master/Electronics/DTMF-Decoder/ManufactureProcess/2013-06-05%2017.26.01.jpg)

![ScreenShot](https://github.com/carlosgs/PrintrCamBot/raw/master/Electronics/DTMF-Decoder/ManufactureProcess/2013-06-05%2019.35.06.jpg)

Regarding Dropcam's power supply
--
The tray of the robot has been designed to carry a medium-sized Li-Po battery, and also a 5V regulator. This would supply the 2A required by the Dropcam, and the few milliamps required by the rest of the robot.

To-Do list
--
- Add counter-balance weight for the main frame
- Add second "travel wheel" to improve stability
- Wait for Printrbot's feedback! :)

License  
--
License: **Attribution - Share Alike - Creative Commons (<http://creativecommons.org/licenses/by-sa/3.0/>)**  

Author:  
--
- **Carlosgs (<http://carlosgs.es>)**

