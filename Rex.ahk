k::reload
return
ç::exitapp
return

f7::     ;;;;;;;;;;TURN ON

Global Layer := 82

;Basalt = 82
;Granite = 83
;Diorite = 84
;Obsidian = 85
;Marble = 86
;Mantle = 87
;Core = 88

;;;;;;;;;;;;;;;;;;;;;;;;VAR

x := A_screenWidth
y := A_screenHeight
pos1 := x/2
pos2 := y/2
Random gg, 45, 100
Random ez, 1500, 8900
Random cutie, 500, 3333
Random PORRA, 2500, 5000
Random FastMouseMove, 10, 511
Laila = 0
Main := 1
cu := 1
bb := 12

;;;;;;;;;;;;;;;;;;;;;;;;VAR
Send {Tab down} 
Sleep, cutie
Send {Tab up}

MouseMove, 500, 600
Sleep, PORRA
Click, Right, down
MouseMove, 0, -8, 100, R
Click, Right, Up
Send {Left down}
sleep 1921
Send {Left up}

sleep, cutie

Send, {w down}
sleep, 1790
Send, {w up}
sleep, cutie

Button()

Sleep, 4500


Send {> down}
Send {> up}

Sleep, cutie

EquipAll()

Send {i up}{i down}{i up}{i down}{i up}{i down}{i up}{i down}{i up}

Loop
{	;pega os Text tudo

Send, {Space down}
Sleep, FastMouseMove
Send, {Space up}

if bb = 12
{
Click, Left, down
Send, {w down}
bb = 11
}

Text:="|<>*42$205.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUPzzzyzzzzvPzzzzTjzkQTzzzzzzjzzzzzsBzzzzzzzzzhzzzzbzzyA7zzzzzzrzzzzzzS7XsFgD7amqyAMsVv3zCNwQQQQD37zzzzzj1Yw0q39u/PT4ZN9xUz7QygYga31fzzzzzrgqSnPNgw1hjamRYyqTliTCkwvNClzzzzzvqEDNhgUS8qrq1U2TPDwnDk0SRgbQTzzzzxvAjgqqNT4vPvZd/DhbkMDoZZYqMB/zzzzyxb7qPPCDmRhxsllXqnsSDssssvC6Bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"

if (ok:=FindText(X, Y, 676-150000, 41-150000, 676+150000, 41+150000, 0, 0, Text))
{

Send, {w up}
Click, Left, up

  Sleep, 40000

Send {esc down}
Sleep, FastMouseMove
Send {esc up}

Send {r down}
Sleep, FastMouseMove
Send {r up}

Send {Enter down}
Sleep, FastMouseMove
Send {Enter up}

Sleep, 5000

Send {> down} Sleep, gg Send {> up}
Send {> down} Sleep, gg Send {> up}
Send {> down} Sleep, gg Send {> up}
Send {> down} Sleep, gg Send {> up}

Send {Left down}
sleep 1921
Send {Left up}

Sleep, cutie

Send, {w down}
sleep, 2800
Send, {w up}
sleep, 1533

Button()

Send {> down}
Send {> up}

EquipAll()

bb = 12

}

Text:="|<>*69$25.00000000000000000000000000000000000007zzzkMAAA46622mSNNND0cgkmkGMM3zzzs000000000000000000000000000000000E"

if (ok:=FindText(X, Y, 704-150000, 43-150000, 704+150000, 43+150000, 0, 0, Text))
{

Send, {w up}
Click, Left, up
AutoClick()

}

} until Main = 2

;;;;;;;;;;;;;;;;;;;

Button()
{

if Layer = 82
{
loop
{

if FindClick("*0xC4C6C4", "E1E1E1")
FindClick("*0xC4C6C4", "E1E1E1")
FindClick("*0xC4C6C4", "E1E1E1")
 cu = 0

}until cu = 0

}

if Layer = 83
{
MouseClick, left, 552, 390
}

if Layer = 84
{
MouseClick, left, 629, 393
}

if Layer = 85
{
MouseClick, left, 390, 495
}

if Layer = 86
{
MouseClick, left, 475, 493
}

if Layer = 87
{
MouseClick, left, 552, 496
}

if Layer = 88
{
MouseClick, left, 628, 491
}

}

;;;;;;;;;;;;;;;;;;;

AutoClick()
{
loop
{
MouseClick, left, 647, 10
Sleep, ez
MouseClick, left, 647, 10
} until Laila = 1

}

EquipAll()
{
Send {2 down}
Sleep, PORRA
Click, Left, down
Click, Left, up
Sleep, PORRA
Send {2 up}
Send {3 down}
Sleep, PORRA
Click, Left, down
Click, Left, up
Sleep, PORRA
Send {3 up}
Send {4 down}
Sleep, PORRA
Click, Left, down
Click, Left, up
Sleep, PORRA
Send {4 up}
Send {5 down}
Sleep, PORRA
Click, Left, down
Click, Left, up
Sleep, PORRA
Send {5 up}
Send {6 down}
Sleep, PORRA
Click, Left, down
Click, Left, up
Sleep, PORRA
Send {6 up}
Send {7 down}
Sleep, PORRA
Click, Left, down
Click, Left, up
Sleep, PORRA
Send {7 up}
Send {8 down}
Sleep, PORRA
Click, Left, down
Click, Left, up
Sleep, PORRA
Send {8 up}
Send {9 down}
Sleep, PORRA
Click, Left, down
Click, Left, up
Sleep, PORRA
Send {9 up}
Send {0 down}
Sleep, PORRA
Click, Left, down
Click, Left, up
Sleep, PORRA
Send {0 up}
Sleep, PORRA
Send {1 down}
Sleep, PORRA
Send {1 up}
}