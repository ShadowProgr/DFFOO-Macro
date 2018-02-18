#Persistent
#NoEnv
#SingleInstance force

IniRead, BattleTimeMin, config.ini, DFFOMacro, BattleTimeMin, 20
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
	Global TimerCount, RunCount

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

	TimerCount := 0
	
	ToolTip, Waiting for battle to finish (%TimerCount%), 15, 30
	SetTimer, UpdateTimer, 1000
	
	Sleep, BattleTimeMin * 1000

	BattleEnded := SelectButton("Next.PNG", ((BattleTimeMax - BattleTimeMin) * 2), 100)
	if (BattleEnded == false) {
		Goto, ClickAuto
	}
	
	SetTimer, UpdateTimer, Off
	
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

SelectButton(ImageName, RetryTimeMulti := 2, DiffAllowed := 100) {
	Global RetryTime

	FailCount := 0

	While (FailCount != (RetryTime * RetryTimeMulti)) {
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *%DiffAllowed% %ImageName%
		if (FoundX != "" and FoundY != "") {
			MouseMove, %FoundX%, %FoundY%
			CustomClick()
			return true
		} else {
			FailCount := FailCount + 1
			TimedSleep(1)
		}
	}
	
	return false
}

SelectEndingButtons(RetryTimeMulti := 2, DiffAllowed := 100) {
	Global RetryTime
	
	FailCount := 0

	While (FailCount != (RetryTime * RetryTimeMulti)) {
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *%DiffAllowed% Next.PNG
		if (FoundX != "" and FoundY != "") {
			MouseMove, %FoundX%, %FoundY%
			CustomClick()
			TimedSleep(2)
		} else {
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *%DiffAllowed% Confirm.PNG
			if (FoundX != "" and FoundY != "") {
				MouseMove, %FoundX%, %FoundY%
				CustomClick()
				TimedSleep(2)
			} else {
				FailCount := FailCount + 1
			}
		}
	}
	
	return
}

CustomClick() {
	Click, down
	Sleep, 25
	Click, up
}

TimedSleep(i := 1) {
	Random, SleepTime, 400, 600
	Sleep, SleepTime * i
	return
}

ExitScript() {
	ToolTip
	MsgBox, Exiting script at %A_Hour%:%A_Min%
	ExitApp
}

UpdateTimer:
	TimerCount := TimerCount + 1
	ToolTip, Waiting for battle to finish (%TimerCount%), 15, 30

Esc::
	ExitApp