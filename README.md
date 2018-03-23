# Dissidia Final Fantasy Opera Omnia Macro

This is a macro written using AutoHotkey
It allows player/user to automate the boring process of farming a specific quest mission

## DISCLAIMER
Usage of automation software and macros are against the ToS of the game. While the chance of being banned for usage of this macro is extremely unlikely, please be aware that the risk is still there. You are responsible for your own actions.

## Features
- Farms one mission over and over until you drop! (or until your inventory gets full)
- Shows numbers of runs completed
- Summon ally at start of each battle
- TODO: Farm cycle quests too
- TODO: Show average clear speed

## Requirements
- Android emulator to run the game on PC.  Currently only Bluestacks work with DFFOO
- Autohotkey to run the .ahk script


## Setting up
- Download this repository
- Now, using any screen capturing tool *(I recommend Window's default Snipping Tool)*, you will screenshot the buttons for the script to click.
### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Needed images
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- *Start.png* - Image of the quest

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- *Begin.png* - The **Begin** button after selecting the quest

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- *LastOnline.png* - The  **Last Online** text of users after clicking the Begin button

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- *Begin2.png* - The second **Begin** button, this one after selecting support ally

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- *Auto.png* - The image of **Auto** battle button

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- *Next.png* - The image of **Next** button after battle's end

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- *Confirm.png* - The image of **Confirm** button when ranking up

- Please make sure you have all the needed images before starting the script

- *(Optional)* You can edit the values in **config.ini** file to customize the script to your needs

- To end the script hit the **Esc** button

- Enjoy!


## How to screenshot buttons
Please note that you need to screenshot inside the clickable area of the buttons. Here are some examples of good and bad images
### Good crop
![Good crop 1](https://raw.githubusercontent.com/ShadowProgr/DFFOO-Macro/master/tutorial/GoodExample1.png)
![Good crop 2](https://raw.githubusercontent.com/ShadowProgr/DFFOO-Macro/master/tutorial/GoodExample2.png)
### Bad crop
![Bad crop 1](https://raw.githubusercontent.com/ShadowProgr/DFFOO-Macro/master/tutorial/BadExample1.png)
![Bad crop 2](https://raw.githubusercontent.com/ShadowProgr/DFFOO-Macro/master/tutorial/BadExample2.png)


## Preview
A short clip of the script in action https://www.youtube.com/watch?v=Z-5tRLwCgYA


## Changelog
- 02/03/2018 Rewritten timer system, which should be much more precise now. Added ability to summon ally at the start of battle
- 18/02/2018 Rewritten most parts of the code to be more clean. Added tooltips that informs you of the macro's process
- 15/02/2018 Now macro continues when you rank up instead of stopping
- 14/02/2018 Initial version


## FAQ
**Q:** Why images? Why not a time based macro?

**A:** Because time based macros are either unstable or inefficient

**Q:** The script stops when the battle is loading, help!!1!

**A:** Open the **config.ini** file with any text editor (even Notepad works) and increase the *RetryTime* value

**Q:** Do you still play DFFOO?

**A:** Yes, and no, you may not add me.


## Feedback
This script haven't been heavily test so bugs might exist, if you got any problem with it leave an issue here at github, I'll help however I can :D


## Contact

You can get support for setting up and leave feedback in this Discord server https://discord.gg/krTtpHs
