BattleTimeMin := 20
BattleTimMax := 100

Sleep, 2000

CoordMode Pixel
CoordMode Mouse

StartScript:

SelectMission:
MissionSelected := false
FailCount := 0

While (MissionSelected = false) {
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *130 Start.PNG
	if (FoundX <> "" and FoundY <> "")
	{
		MouseMove, %FoundX%, %FoundY%
		Sleep, 50
		Click, down
		Sleep, 50
		Click, up
		MissionSelected = true
	}
	else
	{
		FailCount := FailCount + 1
		if (FailCount = 10) {
			Goto, ExitScript
		}
		Random, SleepTime, 400, 600
		Sleep, %SleepTime% * 2
	}
}

Random, SleepTime, 400, 600
Sleep, %SleepTime% * 3

StartMission1:
MissionStarted1 := false
FailCount := 0

While (MissionStarted1 = false) {
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 Begin.PNG
	if (FoundX <> "" and FoundY <> "")
	{
		MouseMove, %FoundX%, %FoundY%
		Sleep, 50
		Click, down
		Sleep, 50
		Click, up
		MissionStarted1 = true
	}
	else
	{
		FailCount := FailCount + 1
		if (FailCount = 10) {
			Goto, SelectMission
		}
		Random, SleepTime, 400, 600
		Sleep, %SleepTime%
	}
}

Random, SleepTime, 400, 600
Sleep, %SleepTime% * 3

StartMission2:
MissionStarted2 := false
FailCount := 0

While (MissionStarted2 = false) {
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 LastOnline.PNG
	if (FoundX <> "" and FoundY <> "")
	{
		MouseMove, %FoundX%, %FoundY%
		Sleep, 50
		Click, down
		Sleep, 50
		Click, up
		MissionStarted2 = true
	}
	else
	{
		FailCount := FailCount + 1
		if (FailCount = 10) {
			Goto, StartMission1
		}
		Random, SleepTime, 400, 600
		Sleep, %SleepTime%
	}
}

Random, SleepTime, 400, 600
Sleep, %SleepTime% * 3

StartMission3:
MissionStarted3 := false
FailCount := 0

While (MissionStarted3 = false) {
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 Begin2.PNG
	if (FoundX <> "" and FoundY <> "")
	{
		MouseMove, %FoundX%, %FoundY%
		Sleep, 50
		Click, down
		Sleep, 50
		Click, up
		MissionStarted3 = true
	}
	else
	{
		FailCount := FailCount + 1
		if (FailCount = 10) {
			Goto, StartMission2
		}
		Random, SleepTime, 400, 600
		Sleep, %SleepTime%
	}
}

Random, SleepTime, 400, 600
Sleep, %SleepTime% * 10

StartAuto:
AutoStarted := false
FailCount := 0

While (AutoStarted = false) {
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 Auto.PNG
	if (FoundX <> "" and FoundY <> "")
	{
		MouseMove, %FoundX%, %FoundY%
		Sleep, 50
		Click, down
		Sleep, 50
		Click, up
		AutoStarted = true
	}
	else
	{
		FailCount := FailCount + 1
		if (FailCount = 10) {
			Goto, StartMission3
		}
		Random, SleepTime, 400, 600
		Sleep, %SleepTime%
	}
}

Sleep, %BattleTimeMin% * 1000

FirstNext:
BattleEnded := false
FailCount := 0

While (BattleEnded = false) {
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 Next.PNG
	if (FoundX <> "" and FoundY <> "")
	{
		MouseMove, %FoundX%, %FoundY%
		Sleep, 50
		Click, down
		Sleep, 50
		Click, up
		BattleEnded := true
	}
	else
	{
		FailCount := FailCount + 1
		if (FailCount = (%BattleTimMax% - %BattleTimeMin%) * 2) {
			Goto, StartAuto
		}
		Sleep, 500
	}
}

Random, SleepTime, 400, 600
Sleep, %SleepTime%

NextLoop:
NextClicked := false
FailCount := 0

While (NextClicked = false) {
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 Next.PNG
	if (FoundX <> "" and FoundY <> "")
	{
		MouseMove, %FoundX%, %FoundY%
		Sleep, 50
		Click, down
		Sleep, 50
		Click, up
		FailCount := 0
		Random, SleepTime, 400, 600
		Sleep, %SleepTime%
	}
	else
	{
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 Confirm.PNG
		if (FoundX <> "" and FoundY <> "")
		{
			MouseMove, %FoundX%, %FoundY%
			Sleep, 50
			Click, down
			Sleep, 50
			Click, up
			FailCount := 0
			Random, SleepTime, 400, 600
			Sleep, %SleepTime%
		} else {
			FailCount := FailCount + 1
			if (FailCount = 10) {
				NextClicked = true
			}
		}
	}
}

Random, SleepTime, 400, 600
Sleep, %SleepTime%

Goto, StartScript


ExitScript:
MsgBox Exiting script at %A_Hour%:%A_Min%
ExitApp
Esc::ExitApp