!--------------------------------------------------
!- 28 October 2019 21:15:11
!- Import of : JET.PRG
!- From Disk : c:\users\marka\games\c64\cbmprg\cassette50reboot\jetflight.d64
!- Commodore 64
!--------------------------------------------------
0 DIM SC(10):DIMSC$(10)
2 VO=54296:AT=54277:HI=54273:LO=54272:SU=54278:WA=54276
4 D=0:G=0:CO=11:HS=0:LA=0:SC=0:VC=53248
6 FORX=1TO10:SC(X)=0:SC$(X)="{green}*{yellow}jet{space*3}flight{green}*":NEXT
8 A$="{home}{down*16}"
10 B$="{right*31}"
12 C$="{black}{red}{cyan}{purple}{green}{blue}{yellow}{orange}{red}{brown}{pink}{dark gray}{gray}{light green}{light blue}{light gray}"
14 CS=0:GOSUB 800:IF G=0 THEN GOSUB 1000
16 GOSUB 2000
18 CS=1:GOSUB800:POKEVC+24,(PEEK(VC+24)AND240)OR14:POKEVC+31,0
20 PRINT"{home}{green}{right*3}score"SC,"{right}high score{space*3}"HS
22 FOR Z=1 TO 38:PRINTLEFT$(A$,24)RIGHT$(B$,Z)"{green}{reverse on}e{reverse off}";:NEXT
24 FOR X=3 TO 36:FOR Y=0 TO INT(RND(1)*(14*SK)+1)
26 PRINTLEFT$(A$,23-Y)RIGHT$(B$,X)MID$(C$,(XAND15)+1,1)"{reverse on}a{up}{light green}&{reverse off}";:NEXT Y,X
28 IF PY>45 THEN 32
30 PX=0:PY=45:BS=16
32 X=PX:Y=PY:C1=INT(RND(1)*250+50):C2=344-C1:CL=INT(C1/256)+INT(C2/256)*8
34 POKEVC,C1AND255:POKEVC+1,69+LA*8:POKEVC+6,C2AND255:POKEVC+7,92+LA*8:POKEVC+29,9
36 POKE VC+2,XAND255:POKEVC+3,Y:POKEVC+16,INT(X/256)*2+CL:POKEVC+21,11
38 POKEVO,1:POKEAT,68:POKEWA,128:POKELO,7:POKEHI,126
40 IF X<4THENDX=SP:Y=Y+8:POKE2041,192
42 IF X<256 THEN POKEVC+16,PEEK(VC+16)AND253
44 IF X>255 THEN POKE VC+16,PEEK(VC+16)OR 2
46 IF X>343 THEN DX=-SP:Y=Y+8:POKE 2041,193
48 POKE VC+2,XAND255:POKEVC+3,Y:POKEWA,129
50 PRINT"{home}{green}"TAB(8)SCTAB(34)HS
52 IF (PEEK(VC+31)AND2)=2 THEN POKEWA,128:GOTO700
54 IF X<>BSTHEN60
56 BS=BS+8*DX/SP
58 IF X>8 AND X<336ANDPEEK(KEY)=K1ANDD=0THENGOSUB500
60 IF D>0THEN GOSUB600:GOTO64
62 FOR T=1 TO SP*10:NEXT
64 POKEWA,128
66 IF X>296 AND Y=213 THEN 70
68 X=X+DX:GOTO 40
70 FOR T=1 TO 5:POKE1936,131:FORTT=1TO250:NEXT:POKE1936,132:FORTT=1TO250:NEXT:NEXT
72 POKE1936,32:POKEVC+16,PEEK(VC+16)AND253:POKEVC+21,PEEK(VC+21)AND253:POKELO,O:POKEHI,0
74 FOR X=32 TO 314STEP2:Y=242-180*SIN(X/200)
76 POKEVC+2,XAND255:POKEVC+3,Y:POKEVC+16,PEEK(VC+16)ORINT(X/256)*2:POKEVC+21,PEEK(VC+21)OR2
78 POKEVO,1:POKEAT,16:POKEWA,129:POKELO,7:POKEHI,126
80 FOR T=1 TO 10:NEXT:POKEWA,128:NEXT:POKEWA,128
82 POKE VC+16,0:POKEVC+21,0
84 D=0:PX=ABS(PX-344):PY=PY+8:BS=ABS(16-PX)
86 BP=INT((RND(1)*5+10)*SC/100)
88 PRINT"{home}{down*6}"TAB(11)"{blue}bonus points{space*2}"BP
90 PRINT"{down*2}{right*2}your plane is re-fuelled and ready !"
92 PRINT TAB(12)"{down*3}{purple}{cm p*11}"
94 PRINT TAB(6)"press{cm h}{cyan}"D$"{purple}Hto start"
96 PRINT TAB(12)"{cm t*13}"
98 IF PEEK(KEY)<>K1 THEN SB=SB+1:GOTO108
100 IF PEEK(KEY)<>K2 THEN 100
102 SB=0:SC=SC+BP:IF HS<SCTHENHS=SC
104 LA=LA+1:IF LA=5 THEN SK=SK+.15:LA=0:PY=45:IF SK>1THEN SK=1
106 GOTO 18
108 IF SB>20 THEN PRINTTAB(13)"{up*2}{purple}"D$"{down}"
110 IF SB>40THEN SB=0:PRINT"{up*2}";:GOTO94
112 GOTO 98
500 BX=X:BY=Y+8
502 IF BX>255 THEN POKEVC+16,PEEK(VC+16)OR4
504 D=INT(RND(1)*SP+SP/2)
510 RETURN
600 B=(1064+(BX-16)/8+(BY-45)*5)
602 IF B>1943 THEN D=0:GOTO 610
604 POKE VC+4,BXAND255:POKEVC+5,BY:POKEVC+21,PEEK(VC+21)OR4
606 IF PEEK(B)<>32 THEN D=D-1:SC=SC+1:POKEB,32
608 IF PEEK(B+40)=129THEN POKE B+40,130
610 IF D=0 THEN POKE VC+21,PEEK(VC+21)AND251:POKEVC+16,PEEK(VC+16)AND251
612 BY=BY+8
614 IF SC>HI THEN HS=SC
616 RETURN
700 POKE (VC+16),PEEK(VC+16)AND251:POKE(VC+21),PEEK(VC+21)AND251
702 IF DX>0 THEN POKE 2041,195
704 IF DX<0 THEN POKE 2041,196
706 POKE VO,15:POKEAT,68:POKESU,240:POKEWA,129:POKELO,200:POKEHI,40
708 FORV1=15TO0STEP-.25:POKEVO,V1:POKEVC+40,15-V1:FOR T=1TO10:NEXTT,V1:POKEWA,128
710 POKEVC+40,CO:POKEVC+27,9
712 FOR PY=YTO213STEP2:POKEVC+3,PY:FORT=1TO10:NEXTT,PY
714 PRINT"{home}{down*4}"TAB(10)"bad luck try again."
716 FOR X=15 TO1STEP-1:POKEVC+32,X:POKEVC+33,X:FOR T=1 TO 100:NEXT
718 POKEVC+17,11:FORT=1TO150:NEXT:POKEVC+17,27:NEXT
720 FOR T=1 TO 1000:NEXT
722 POKE VC+21,0:POKEVC+16,0
724 CS=6:GOSUB800
726 POKE VC+24,21
728 POKE 198,0
730 GOSUB 5000
732 D=0:LA=0:PY=45:SC=0
734 GOTO 14
800 PRINTCHR$(147)
802 POKE VC+32,CS:POKE VC+33,CS
804 RETURN
1000 PRINT CHR$(147)
1002 PRINTLEFT$(A$,7)TAB(7)"{cyan}do you want joystick y/n"
1004 P=PEEK(197)
1006 IFP=25THENKEY=56320:K1=111:K2=127:D$="fire button":E$="{reverse on}fire button{reverse off}":GOTO1012
1008 IFP=39THENKEY=197:K1=60:K2=64:D$=" space bar{sh space}":E$="{reverse on} space bar {reverse off}":GOTO 1012
1010 GOTO 1004
1012 PRINTTAB(11)"{down*3}skill level{space*3}1-5"
1014 PRINTTAB(11)"{down}[1-hard{space*2}5-easy]"
1020 P=PEEK(197)
1022 IF P=56 THENSK=1:GOTO1034
1024 IFP=59THENSK=.95:GOTO1034
1026 IF P=8 THEN SK=.7:GOTO1034
1028 IF P=11 THEN SK=.55:GOTO 1034
1030 IF P=16 THEN SK=.4:GOTO1034
1032 GOTO 1020
1034 PRINTTAB(14)"{down*3}plane speed"
1036 PRINTTAB(11)"{down}[ f-fast{space*2}s-slow ]"
1038 P=PEEK(197)
1040 IF P=21 THEN SP=8:RETURN
1042 IF P=13 THEN SP=4:RETURN
1044 GOTO 1038
2000 POKE VC+17,11:PRINT"{clear}"
2010 PRINT:PRINT:PRINT
2020 PRINT"{cyan}{space*13}QQQQQ{sh space}QQQQQ{sh space}QQQQQ"
2022 PRINT"{green}{space*15}Q{space*3}Q{space*6}QQQ"
2023 PRINT"{yellow}{space*15}Q{sh space*3}QQQ{sh space*4}QQQ"
2024 PRINT"{blue}{space*15}Q{sh space*3}Q{sh space*6}QQQ"
2025 PRINT"{gray}{space*13}Q{sh space}Q{sh space*3}QQQQQ{sh space*2}QQQ"
2026 PRINT"{light blue}{space*14}QQ{sh space*3}QQQQQ{sh space*2}QQQ":PRINT:PRINT
2027 PRINT"{white}{space*4}QQQQ{sh space}QQ {sh space*2}QQQQQ{sh space*2}QQQ{sh space*2}QQ{sh space}QQ{sh space*2}QQQQQ"
2028 PRINT"{orange}{space*4}QQ{space*3}QQ{space*4}QQQ{space*2}QQ{space*4}QQ QQ{space*3}QQQ"
2029 PRINT"{pink}{space*4}QQQ{sh space*2}QQ{sh space*4}QQQ{sh space*2}QQ{sh space*2}Q{sh space}QQQQQ{sh space*3}QQQ"
2030 PRINT"{light blue}{space*4}QQ{sh space*3}QQQQ{sh space*2}QQQ{sh space*3}QQQQ{sh space}QQ QQ{sh space*3}QQQ"
2031 PRINT"{light gray}{space*4}QQ{sh space*3}QQQQ{sh space}QQQQQ{sh space*3}QQQ{sh space}QQ{sh space}QQ{sh space*3}QQQ"
2032 POKE VC+17,27
2034 FOR T=1 TO 1000:NEXT
2036 IF G=1 THEN RETURN
3000 POKE 52,48:POKE 56,48
3002 POKE 56334,PEEK(56334)AND254
3004 POKE 1,PEEK(1)AND251
3006 FOR I=0 TO 1024:POKEI+14336,PEEK(I+53248):NEXT
3008 POKE1,PEEK(1)OR4
3010 POKE 56334,PEEK(56334)OR1
3012 FOR I=0 TO 47:READ A
3014 POKE 15360+I,A:NEXT
3016 FOR I=0 TO 383:READ A:POKE 12288+I,A:NEXT
3018 POKE 2040,197:POKEVC+39,15
3020 POKE2041,192:POKE VC+40,CO
3022 POKE 2042,194:POKE VC+41,12
3024 POKE 2043,197:POKE VC+42,15
4000 POKE VC+17,11:POKE VC+24,23
4002 PRINT"{clear}{white}{right*2}{cm @*36}"
4004 PRINT"{right} {green}{reverse on}YOU ARE THE PILOT OF A FIGHTER PLANE{reverse off}{white}{sh space}"
4006 PRINT"{right*2}{cm t*36}"
4008 PRINT"{down}{right*2}{yellow}Fuel is running dangerously low and"
4010 PRINT"{down}{right*2}in order to re-fuel{space*2}your bomber.you"
4012 PRINT"{down}{right*2}must destroy{space*2}the enemy city before"
4014 PRINT"{down}{right*2}landing. Use your bombs carefully as"
4016 PRINT"{down}{right*2}there is only 1 available at a time."
4018 PRINT"{down*2}{right*2}Your skill level is increased after"
4020 PRINT"{down}{right*2}five consecutive landings. You may"
4022 PRINT "{down}{right*2}change your skill level up or down"
4024 PRINT"{down}{right*2}at the end of each game. GOOD{sh space}LUCK"
4026 PRINT"{down*2}{right*2}{red}* {blue}USE{sh space}FIRE{sh space}BUTTON/SPACE{sh space}BAR{sh space}TO{sh space}START{red}*{home}"
4028 POKE VC+17,27
4030 IF PEEK(KEY)<>K1THEN SB=SB+1:GOTO 4036
4032 IF PEEK(KEY)<>K2 THEN 4032
4034 G=1:SB=0:RETURN
4036 IF SB>10 THEN PRINTA$TAB(12)D$;
4038 IF SB>20 THEN SB=0:PRINTTA$TAB(12)E$;
4040 GOTO 4030
5000 Z=0:FOR X=1 TO 10:IF SC>SC(X)THEN Z=X:X=11
5002 NEXT:IF Z=0 THEN 5020
5004 PRINT"{clear}{down*9}"TAB(7)"enter text for score table"
5006 INPUT "{down*3}{right*8}name{right*4}................";N$
5008 IF LEN(N$)>15 THEN N$=LEFT$(N$,15)
5010 FOR X=1 TO 15:Z$=MID$(N$,X,1):IF Z$="."THENN$=LEFT$(N$,X-1):X=16
5012 NEXT
5014 IF Z=10 THEN 5018
5016 FOR X=9 TO Z STEP-1:SC=(X+1)=SC(X):SC$(X+1)=SC$(X):NEXT
5018 SC(Z)=SC:SC$(Z)=N$
5020 POKE VC+17,11:PRINT "{clear}"TAB(12)"{yellow}** {green}score table{yellow}**{down}"
5022 FOR X=1 TO10:PRINT"{down}{green} run{yellow}";X;TAB(10);"{white}";SC(X);SC(X);TAB(23);"{yellow}";SC$(X)
5024 NEXT
5028 POKEVC+17,27:POKEVC+27,2
5030 FOR X=0 TO 314 STEP 2:Y=65+100*SIN(X/100)
5032 POKE 2041,192:POKEVC+29,2:POKEVC+23,2:POKEVC+40,7
5034 POKE VC+16,INT(X/256)*2:POKEVC+2,XAND255:POKEVC+3,Y:POKEVC+21,2
5036 NEXT
5038 POKE VC+21,0:POKE VC+2,0:POKEVC+3,0:POKEVC+29,0:POKEVC+23,0:POKEVC+40,CO:POKEVC+27,0
5040 IF PEEK(197)=4 THEN SB=0:SS=0:CS=0:GOSUB800:GOSUB1000:RETURN
5042 GOTO 5052
5044 IF PEEK(197)=3 THEN SYS64738
5046 IF PEEK(KEY)<>K1THEN 5052
5048 IF PEEK(KEY)<>K2THEN 5048
5050 SB=0:SS=0:RETURN
5052 SB=SB+1:SS=SS+1:IF SS=300THENSB=0:SS=0:RETURN
5054 IF SS>75ANDSS=<150THEN5066
5056 IF SS>150ANDSS=<255 THEN 5074
5058 IF SB=<2THENPRINTA$TAB(7)"press {purple}"E$" to start";
5060 IF SB>2ANDSB=<4THENPRINTA$TAB(13)D$"";
5062 IF SB>4 THEN SB=0
5064 GOTO 5046
5066 IF SB=<2THENPRINTA$TAB(7)"press {white}[f1] to change level";
5068 IF SB>2ANDSB=<4THENPRINTA$TAB(13)"{reverse on}{white}[f1]{reverse off}";
5070 IF SB>4 THEN SB=0
5072 GOTO 5040
5074 IF SB=<2THENPRINTA$TAB(7)" press {yellow}[f1] to quit game !";
5076 IF SB>2ANDSB=<4 THEN PRINTA$TAB(14)"{reverse on}{yellow}[f7]{reverse off}";
5078 IF SB>4 THEN SB=0
5080 GOTO 5044
5500 DATA 0,24,24,24,24,60,126,255
5502 DATA 255,153,153,255,255,153,153,255
5504 DATA 128,152,153,255,255,153,153,255
5506 DATA 56,56,16,124,186,186,40,108
5508 DATA 56,186,146,124,56,56,40,108
5510 DATA 90,165,90,189,189,90,165,90
5512 DATA 0,0,0,0,0,0,0,0
5514 DATA 0,0,0,0,0,0,0,0
5516 DATA 0,0,0,0,0,0,0,0
5518 DATA 0,0,0,0,0,0,0,0
5520 DATA 0,0,0,0,0,0,0,96
5522 DATA 255,254,240,24,96,240,48,192
5524 DATA 255,255,227,225,225,251,127,255
5526 DATA 255,127,255,251,15,255,195,0
5528 DATA 0,0,0,0,0,0,0,0
5530 DATA 0,0,0,0,0,0,0,0
5532 DATA 0,0,0,0,0,0,0,0
5534 DATA 0,0,0,0,0,0,0,0
5536 DATA 0,0,0,0,0,0,0,127
5538 DATA 255,6,6,24,15,3,12,15
5540 DATA 199,255,255,223,255,255,255,255
5542 DATA 254,223,255,254,195,255,240,0
5544 DATA 0,0,0,0,0,0,0,0
5546 DATA 0,0,0,0,0,0,0,0
5548 DATA 0,0,0,0,0,0,0,0
5550 DATA 0,0,0,0,0,0,0,0
5552 DATA 0,0,0,0,0,0,0,0
5554 DATA 60,0,0,24,0,0,60,0
5556 DATA 0,60,0,0,60,0,0,60
5558 DATA 0,0,60,0,0,24,0,0
5560 DATA 0,0,0,0,0,0,0,0
5562 DATA 0,0,0,0,0,0,0,0
5564 DATA 0,0,0,0,0,0,0,0
5566 DATA 0,0,0,0,0,0,0,0
5568 DATA 0,0,255,0,0,24,0,96
5570 DATA 48,254,240,255,96,240,255,192
5572 DATA 255,255,227,255,255,251,127,255
5574 DATA 255,127,0,251,15,0,195,0
5576 DATA 0,0,0,0,0,0,0,0
5578 DATA 0,0,0,0,0,0,0,0
5580 DATA 0,0,0,0,0,0,0,0
5582 DATA 0,0,0,0,0,0,0,0
5584 DATA 0,0,255,0,0,24,0,127
5586 DATA 12,6,6,255,15,3,255,15
5588 DATA 199,255,255,223,255,255,255,255
5590 DATA 254,223,0,254,195,0,240,0
5592 DATA 0,0,0,0,0,0,0,0
5594 DATA 0,0,30,0,0,127,128,14
5596 DATA 255,192,63,255,240,127,255,252
5598 DATA 127,255,254,255,255,254,255,255
5600 DATA 254,255,255,254,127,255,252,127
5602 DATA 255,248,63,255,224,63,255,128
5604 DATA 31,255,0,15,255,0,7,252
5606 DATA 0,1,240,0,0,0,0,0
9999 POKE53280,0:POKE53281,0:PRINT"{clear}{orange}"