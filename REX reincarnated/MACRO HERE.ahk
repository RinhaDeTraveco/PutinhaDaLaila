y::
Exitapp
return

f7::     ;;;;;;;;;;TURN ON

Global Layer := 85

;Basalt = 82
;Granite = 83
;Diorite = 84
;Obsidian = 85
;Marble = 86
;Mantle = 87
;Core = 88

;;;;;;;;;;;;;;;;;;;;;;;;VAR

#Include VA.ahk
#SingleInstance, Force
audioMeter := VA_GetAudioMeter()
VA_IAudioMeterInformation_GetMeteringChannelCount(audioMeter, channelCount)
VA_GetDevicePeriod("capture", devicePeriod)

Global lolo := 0
x := A_screenWidth
y := A_screenHeight
pos1 := x/2
pos2 := y/2
Random gg, 45, 100
Random ez, 1500, 8900
Random cutie, 500, 3333
Random PORRA, 2500, 5000
Random LL, 5000, 6000
Random FastMouseMove, 10, 511
Random meno, 50000, 100000
Global Laila = 0
Global Main := 1
Global bb := 12
Global reseting := 1
global stop := 0

;;;;;;;;;;;;;;;;;;;;;;;;VAR

MouseMove, 500, 600
Sleep, PORRA
Click, Right, down
MouseMove, 0, -8, 100, R
Click, Right, Up

Sleep, PORRA

Spawn()

Sleep, PORRA

Button()
Button()

Sleep, 4500

Send {> down}
Sleep, FastMouseMove
Send {> up}

Sleep, cutie

EquipAll()

Send {i up}{i down}{i up}{i down}{i up}{i down}{i up}{i down}{i up}

Loop
{

if reseting = 1
{
VA_IAudioMeterInformation_GetPeakValue(audioMeter, peakValue) 
if (peakValue>.0005)
{
Send, {w up}
Click, Left, up
AutoClick()
}
}

if bb = 12
{
Click, Left, down
Send, {w down}
bb = 11
}

Text:="|<>*42$205.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUPzzzyzzzzvPzzzzTjzkQTzzzzzzjzzzzzsBzzzzzzzzzhzzzzbzzyA7zzzzzzrzzzzzzS7XsFgD7amqyAMsVv3zCNwQQQQD37zzzzzj1Yw0q39u/PT4ZN9xUz7QygYga31fzzzzzrgqSnPNgw1hjamRYyqTliTCkwvNClzzzzzvqEDNhgUS8qrq1U2TPDwnDk0SRgbQTzzzzxvAjgqqNT4vPvZd/DhbkMDoZZYqMB/zzzzyxb7qPPCDmRhxsllXqnsSDssssvC6Bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"

if (ok:=FindText(X, Y, 155, 22, 1123, 89, 0, 0, Text))
{

Send, {w up}
Click, Left, up

reseting = 0

Sleep, 45000

Send {esc down}
Sleep, cutie
Send {esc up}
Sleep, cutie
Send {r down}
Sleep, cutie
Send {r up}
Sleep, cutie
Send {Enter down}
Sleep, cutie
Send {Enter up}

Sleep, 5000

Send {> down} 
Sleep, gg 
Send {> up}
Send {> down} 
Sleep, gg 
Send {> up}
Send {> down} 
Sleep, gg 
Send {> up}
Send {> down} 
Sleep, gg 
Send {> up}
Sleep, cutie
Send {o down} 
sleep, 1200
Send {o up}
Send {o down} 
sleep, 600
Send {o up}
Send {o down} 
sleep, 950
Send {o up}

Spawn()

reseting = 1

Sleep, LL

Button()
Button()

Send {> down}
Send {> up}

Send {i up}{i down}{i up}{i down}{i up}{i down}{i up}{i down}{i up}

EquipAll()

bb = 12
}

if stop = 1
{
Send {w down}
global stop := 0
}

lolo := (lolo +1)

if lolo = 1000
{
Send, {Space down}
Sleep, FastMouseMove
Send, {Space up}
lolo := 0
}

} until Main = 2

;;;;;;;;;;;;;;;;;;;FUNCTIONS

Button()
{

if Layer = 82
{

MouseMove, 803, 395
Sleep, FastMouseMove
Click, Left, down
Click, Left, Up

}

if Layer = 83
{
MouseMove, 905, 412
Sleep, FastMouseMove
Click, Left, down
Click, Left, Up
}

if Layer = 84
{
MouseMove, 1002, 413
Sleep, FastMouseMove
Click, Left, down
Click, Left, Up
}

if Layer = 85
{

MouseMove, 688, 550
Sleep, FastMouseMove
Click, Left, down
Click, Left, Up
}

if Layer = 86
{
MouseMove, 802, 565
Sleep, FastMouseMove
Click, Left, down
Click, Left, Up
}

if Layer = 87
{
MouseMove, 905, 562
Sleep, FastMouseMove
Click, Left, down
Click, Left, Up
}

if Layer = 88
{
MouseMove, 1005, 552
Sleep, FastMouseMove
Click, Left, down
Click, Left, Up
}

}

;;;;;;;;;;;;;;;;;;;

AutoClick()
{

Send {o down}
Sleep, PORRA
Send {o up}

loop
{
MouseClick, left, pos1, pos2
Sleep, meno
} until stop = 1

}

EquipAll()
{
Send {2 down}
Sleep, PORRA
Click, Left, down
Sleep, FastMouseMove
Click, Left, up
Sleep, PORRA
Send {2 up}
Send {3 down}
Sleep, PORRA
Click, Left, down
Sleep, FastMouseMove
Click, Left, up
Sleep, PORRA
Send {3 up}
Send {4 down}
Sleep, PORRA
Click, Left, down
Sleep, FastMouseMove
Click, Left, up
Sleep, PORRA
Send {4 up}
Send {5 down}
Sleep, PORRA
Click, Left, down
Sleep, FastMouseMove
Click, Left, up
Sleep, PORRA
Send {5 up}
Send {6 down}
Sleep, PORRA
Click, Left, down
Sleep, FastMouseMove
Click, Left, up
Sleep, PORRA
Send {6 up}
Send {7 down}
Sleep, PORRA
Click, Left, down
Sleep, FastMouseMove
Click, Left, up
Sleep, PORRA
Send {7 up}
Send {8 down}
Sleep, PORRA
Click, Left, down
Sleep, FastMouseMove
Click, Left, up
Sleep, PORRA
Send {8 up}
Send {9 down}
Sleep, PORRA
Click, Left, down
Sleep, FastMouseMove
Click, Left, up
Sleep, PORRA
Send {9 up}
Send {0 down}
Sleep, PORRA
Click, Left, down
Sleep, FastMouseMove
Click, Left, up
Sleep, PORRA
Send {0 up}
Sleep, PORRA
Send {1 down}
Sleep, FastMouseMove
Send {1 up}
}

Spawn()
{
Send {> down}
Sleep, FastMouseMove
Send {> up}

Send {> down}
Sleep, FastMouseMove
Send {> up}

Send {> down}
Sleep, FastMouseMove
Send {> up}

Send {w down}
Sleep, 1345
Send {w up}

Send {< down}
Sleep, FastMouseMove
Send {< up}

Send {w down}
Sleep, 1545
Send {w up}

Send {> down}
Sleep, FastMouseMove
Send {> up}

Send {i down}{i up}
}
