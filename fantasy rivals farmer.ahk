#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

broj_bitaka := 0

x:= 0
t:= 0

novabitka:

;za ovo vreme treba da se otvori prozor u browseru
	Sleep, 5000
; klik na "play vs cpu" dugme
	Click 1154, 481
	Sleep, 1000
; klik na "fight" dugme
	Click 1264, 871 
;4 runde loop
runda := 1
Loop, 4
{
; cekanje animacija (fight animacije)
	Sleep, 25000 
Random, x, 1, 2

if(x == 1)
{
Goto, ubacivanjelevi
}

if(x == 2)
{
Goto, ubacivanjedesni
}
;darg and drop 1 ubacivanje borca 
ubacivanjelevi:

Click down 717, 651

Loop, 65
{
MouseMove, -2, -2 , 1, R
Sleep, 1
}

Loop, 68
{
MouseMove, -2, 0 , 1, R
Sleep, 1
}


Click up 
Goto, preskok
;darg and drop 1 ubacivanje borca (zatvaranje)

;darg and drop 1 ubacivanje borca 
ubacivanjedesni:
Click down 947, 651
Loop, 65
{
MouseMove, -2, -2 , 1, R
Sleep, 1
}

Loop, 183
{
MouseMove, -2, 0 , 1, R
Sleep, 1
}

Click up 
;darg and drop 1 ubacivanje borca (zatvaranje)
preskok:
; cekanje animacija
	Sleep, 9000 

Random, x, 1, 2
if(x == 1)
{
Goto, izbacivanjegornji
}

if(x == 2)
{
Goto, izbacivanjedonji
}

;darg and drop 1 izbacivanje borca 
izbacivanjegornji:

Click down 450, 520

Loop, 65
{
MouseMove, 2, 2 , 1, R
Sleep, 1
}

Loop, 68
{
MouseMove, 2, 0 , 1, R
Sleep, 1
}

Click up 

Goto, preskok2
;darg and drop 1 izbacivanje borca (zatvaranje)

;darg and drop 1 izbacivanje borca 
izbacivanjedonji:

Click down 450, 800

Loop, 65
{
MouseMove, 2, -2 , 1, R
Sleep, 1
}


Loop, 68
{
MouseMove, 2, 0 , 1, R
Sleep, 1
}


Click up 
;darg and drop 1 izbacivanje borca (zatvaranje)

preskok2:
; cekanje animacija (kratka u ovom slucaju)
	Sleep, 500 

;ubacivanje mane
	mana := 3 ;default

;nasumicno trosenje mane
	Random, mana, 1, 5

;mala sansa za bacanje 6 mane

	Random, x, 1, 20
	if(x == 20){
		mana := 6
		}	

;trosenje ostatka mane u zadnjoj rundi
	if(runda == 4){
	mana := 9
	}
;mala sansa za blefiranje
	if(mana == 5)
	{
	Random, x, 1, 8
		if(x == 8){
			mana := 0
				}		
	}
;mala sansa za all out u 3-oj rundi

	if(runda == 3){
		Random, x, 1, 20
		if(x == 20){
			mana := 9
				}
	}
;kliktanje na dugme za manu

	Loop, %mana%
	{
		Sleep, 400 
		Click 919, 865
	}

;klin na dugme "fight (runda)"

	Sleep, 1000 
	Click 823,613 
; zatvaranje 4 runde loop

runda := runda + 1
}

;cekanje animacija "tresure" (mozda)
	Sleep, 8000
;klik na dugme "lv up"(potrebna su 3 klika)
	Loop, 3
	{
		Sleep, 1500 
		Click 829, 669
	}
;cekanje animacija "tresure" (mozda)
	Sleep, 23000
;klin na dugme "tresure stolen" mozda
	Click 827,766 
;random cekanje (VS detekcije)

Random, t, 1, 15000
Sleep, t

broj_bitaka := broj_bitaka + 1

if(broj_bitaka < 2500){
Goto, novabitka
}





 