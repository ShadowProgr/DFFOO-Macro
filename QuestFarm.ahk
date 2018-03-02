#Persistent
#NoEnv
#SingleInstance force

IniRead, BattleTimeMax, config.ini, DFFOMacro, BattleTimeMax, 120
IniRead, RetryTime, config.ini, DFFOMacro, RetryTime, 10

CoordMode, Pixel
CoordMode, Mouse
CoordMode, ToolTip, Client

Sleep, 3000
RunCount := 1
while (true) {
	Main()
}

Main() {
	Global

	ToolTip, Run number %RunCount%, 15, 7, 2
	
	ChooseMission:
	ToolTip, Selecting mission, 15, 30
	MissionChosen := SelectButton("Start.PNG", 4, 130)
	ToolTip
	if (MissionChosen == false) {
		ExitScript()
	}
	TimedSleep(3)

	ClickBegin1:
	ToolTip, Selecting first begin button, 15, 30
	Begin1Clicked := SelectButton("Begin.PNG")
	ToolTip
	if (Begin1Clicked == false) {
		Goto, ChooseMission
	}
	TimedSleep(3)
	
	ChooseSupport:
	ToolTip, Selecting support, 15, 30
	SupportChosen := SelectButton("LastOnline.PNG")
	ToolTip
	if (SupportChosen == false) {
		Goto, ClickBegin1
	}
	TimedSleep(3)

	ClickBegin2:
	ToolTip, Selecting second begin button, 15, 30
	Begin2Clicked := SelectButton("Begin2.PNG")
	ToolTip
	if (Begin2Clicked == false) {
		Goto, ChooseSupport
	}
	TimedSleep(10)

	ClickAuto:
	ToolTip, Selecting auto button, 15, 30
	AutoClicked := SelectButton("Auto.PNG")
	ToolTip
	if (AutoClicked == false) {
		Goto, ClickBegin2
	}
	TimedSleep(3)
	
	ToolTip, Waiting for battle to finish, 15, 30

	BattleEnded := SelectButton("Next.PNG", BattleTimeMax, 100)
	if (BattleEnded == false) {
		Goto, ClickAuto
	}
	
	ToolTip, Receiving rewards, 15, 30
	SelectEndingButtons()
	Tooltip
	
	RunCount := RunCount + 1
}

FindButton(ImageName, DiffAllowed := 100) {
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *%DiffAllowed% %ImageName%
	if (FoundX != "" and FoundY != "") {
		return true
	}
	return false
}

SelectButton(ImageName, LocalRetryTime := -1, DiffAllowed := 100) {
	Global RetryTime, TimerCount
	
	
	if (LocalRetryTime == -1) {
		LocalRetryTime := RetryTime
	}
	
	StartTimer(LocalRetryTime)

	While (TimerCount < LocalRetryTime) {
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *%DiffAllowed% %ImageName%
		if (FoundX != "" and FoundY != "") {
			MouseMove, %FoundX%, %FoundY%
			CustomClick()
			StopTimer()
			return true
		}
	}
	
	StopTimer()
	return false
}

SelectEndingButtons(LocalRetryTime := -1, DiffAllowed := 100) {
	Global RetryTime, TimerCount
	
	if (LocalRetryTime == -1) {
		LocalRetryTime := RetryTime
	}
	
	StartTimer(LocalRetryTime)
	
	SetTimer, UpdateTimer, 1000

	While (TimerCount < LocalRetryTime) {
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *%DiffAllowed% Next.PNG
		if (FoundX != "" and FoundY != "") {
			MouseMove, %FoundX%, %FoundY%
			CustomClick()
			TimerCount := 0
			TimedSleep(3)
		} else {
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *%DiffAllowed% Confirm.PNG
			if (FoundX != "" and FoundY != "") {
				MouseMove, %FoundX%, %FoundY%
				CustomClick()
				TimerCount := 0
				TimedSleep(3)
			}
		}
	}
	
	StopTimer()
	return
}

CustomClick() {
	BlockInput, On
	Click, down
	Sleep, 50
	Click, up
	BlockInput, Off
}

TimedSleep(i := 1) {
	Random, SleepTime, 400, 600
	Sleep, SleepTime * i
	return
}

StartTimer(LocalTimerMax) {
	Global TimerCount, TimerMax

	TimerCount := 0
	TimerMax := LocalTimerMax
	ToolTip, %LocalTimerMax%, 15, 53, 3
	SetTimer, UpdateTimer, 1000
}

StopTimer() {
	SetTimer, UpdateTimer, Off
	Tooltip, , , , 3
}

ExitScript() {
	ToolTip
	MsgBox, Exiting script at %A_Hour%:%A_Min%
	ExitApp
}

UpdateTimer:
	TimerCount := TimerCount + 1
	TimeLeft := TimerMax - TimerCount
	ToolTip, %TimeLeft%, 15, 53, 3

Esc::
	ExitApp