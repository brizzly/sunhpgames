
::
CODEM

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 		SuperMarioHP50 Game
%
% 		Arrow to move
% 		H to jump
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%!OFF

DC CRC 		00104  %  CRC
DC SCREENADD 	00120  %  Screen
DC HEADERADD 	00128  %  Header height
DC HEXDCW 	2DEAA  %  Make Hex
DC KEY    	0020F  %  OUT=C C=IN
DC ECRAN 	8068D  %  Screen Address

DC SMAX  F % #15
DC LMAX  4 % #4

CP=80100
DCCP 4 FLAG01
DCCP 3 VIE
DCCP 2 MCLIPH
DCCP 2 MCLIPB
DCCP 5 MX
DCCP 5 MY
DCCP 3 COIN
DCCP 1 SCROL.COUNTER
DCCP 5 LEVEL.SURFACE
DCCP 5 LEVEL.DATA
DCCP 2 TICK
DCCP 2 TICK.COUNTER
DCCP 2 M.ANIM
DCCP 2 T.ANIM
DCCP 5 @LIFT
DCCP 3 POSX
DCCP 3 STAGE
DCCP 5 LEVEL
DCCP 5 CUBES
DCCP 2 MJUMP
DCCP 5 STACK
DCCP 5 START

DCCP 5 STABLE
DCCP 2 STYPE
DCCP 3 SDATA
DCCP 5 SX
DCCP 5 SY
DCCP 5 AX
DCCP 5 AY

SAVE
INTOFF
CLRST

LA(3)#1
D0=(5)STAGE DAT0=A.X
AD1EX D0=(5)STACK DAT0=A.A

*NEXTUP
D0=(5)STACK A=DAT0.A
D1=A A=DAT1.A 
?A=0.A GOYES BAD
D0=A A=DAT0 A 
LC(5)$02A2C
?C#A.A GOYES BAD

SKIP
{
 *BAD
 { GOSUBL KEYS UPC }
 GOLONG QUIT
}

A=DAT1.A A+16.A
D0=(5)LEVEL DAT0=A.A 

LC(5)#4800*#2
GOSBVL =MAKE$N
AD0EX D0=A R0=A.W
 
LC(5)#4800-#1/#16
A=0.W 
{
 DAT0=A.W 
 D0+16
 C-1.A UPNC
}

A=R0.A 
A+1.A ABIT=0.0
D0=(5)@LIFT DAT0=A.A
LC(5)#200 A+C.A 
D0=(5)STABLE DAT0=A.A
LC(5)#200 A+C.A 
R0=A.W
LC(5)$880 A+C.A 
R1=A.W 
LC(5)$880 A+C.A 
D0=(5)LEVEL.SURFACE DAT0=A A 
LC(5)$880 A+C.A 
D0=(5)LEVEL.DATA DAT0=A.A

SKUBL {
$E3E3E3E3E3E3E3E3E3E3000000EFFFFF30FFFFFFFFFFFFFFFFFFFF000000FFFF7F70B2F3B2F3B2F3B2F3B2F30000007232E37010F310F310F310F310F300000075BA6560E3E3E3E3E3E3E3E3E3E3000000B71A4D60B6F7B6F7B6F7B6F7B6F7000000B7DA5D60E3E3E3E3E3E3E3E3E3E3000000B7DA5370E3E3F3F3F3F3E7E7E7E7000000FFFFFF7077777777F3F3E7E77777000000EFFFFF30777707078383E0E07070000000300000600000000000000000000000000091000040723757677323637700000000001000004053445114555515110000000000D10000505243533425551511000000000051000040522474525773157700000000005100005052144451545515110000000000D100085067734321235363710000000000100008500000000000000000000000000010000040606006060000000000000000003000006070700A0E000000000000000000EEFFFB307777EEEE00000000000000000083000E008B8FD1F1C3C300000000000000EFFFFF304FCFF2F3E5E700000000000000FFFDFF70CECF73F3D7E700000000000000F9DFC9708787E1E1B7E700000000000000FEA8AE70CCCC3333E3E300000000000000FEADA870E7000000000000000000000000FEADAB7038000000000000000000000000F9D8AC70FB000000000000000000000000FFFFFF70E7000000000000000000000000EFFFFF300000000000000000000000000030000060000000000000000000000000001000004000000000000000000000000000D1000050000000000000000000000000005100004000000000000000000000000000D1000050000000000000000000000000001000004000000000000000000000000000D0000050000000000000000000000000001000085000000000000000000000000000D0000850000000000000000000000000003000006000000000000000000000000000EEFFFB300000000000000000000000000083000E0000000000000000000000000000EFFFFF3000000000000000000000000000FFFFFF7000000000000000000000000000F8D47E700000000000000000000000000075FAAD7000000000000000000000000000FDDA2C7000000000000000000000000000FDDAAF7000000000000000000000000000F88A6C7000000000000000000000000000FFFFFF7000000000000000000000000000EFFFFF3000000000000000000000000000300000600000000000000000000000000091000040000000000000000000000000001000004000000000000000000000000000D1000040000000000000000000000000005100005000000000000000000000000000D1000050000000000000000000000000001000004000000000000000000000000000D1000050000000000000000000000000005100085000000000000000000000000000D1000040000000000000000000000000003000006000000000000000000000000000EEFFFB300000000000000000000000000083000E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
%INCLUDE GFX
} C=RSTK
%C+20.A
R2=C.W

% Tiles %%%%%%%%%%%%%%%%%%%%%%
SKUBL {
$00000000000000000000000000000000E700BA005D00BA005D00BA005D00E700E7007E00BD00FD00FE00FF00FE00E700E70018001B0019001900D900D900E7000000000000002200220022007700FF00FF00DB00FF00FF00FF00FF00DB00FF00FF00FB00FF00E500E500E500E500E5000000C10022001400140014002200C100000000008100C300C300810000000000EF00FF00FF0059004000400040004000FF00FF00FF00C2000000000000000000F700FF00FF006B00020002000200020040004000400040004000400040004000020002000200020002000200020002008100C200C200C1008100C200C200C100080004000200010080004000200010001000200040008000010002000400080000000000000000008100420024001800EF00FF00FF0059000000000000000000FF00FF00FF00CA008100C200C200C100F700FF00FF006B000000000000000000FF00FF00FF00C2000000000000000000E7001800DB00DB00DB00DB00DB00DB00E7001800FB00FF000000000000000000E7001800FB00FB00FB00FB00FB00FF00C100C1008000E300D500C1004100630000000000C300A500FF007E00E7003C00EF001000930056005500D40093001000FF000000000000000000000000000000F7000800C9006A00AA002B00C9000800100010001000100010001000100010000800080008000800080008000800080010009300D4005500560093001000EF000800C9002B00AA006A00C9000800F7000000000000000000000000000000FF00E7003800FB00E7008000C0008000C100E7003800FB00E700810042000100C300FF001400180014001800FF0020002800FF00DF00AF00DF00AF00FF00D700A7002000280020002800CF00200028002000D700A700D700A700F300D700A700D700C600290010005000200014009800670077008800180006000800480084007300FF006F00A600DA00FD00FF00FF00FF00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008
%INCLUDE DATAS
} C=RSTK
%C+20.A
D0=(5)CUBES DAT0=C.A

D1=(5)SCREENADD LC 3F DAT1=C B  	% Set menu height
%D1=0010C A=DAT1.P ABIT=0.3 DAT1=A.P    % screen indicator
A=R0.A 
D0=(5)SCREENADD DAT0=A.A

GOSUBL RESET.CONTER
GOTOL PRESENTATION

*REPLAY
D1=(5)LEVEL A=DAT1.A D1=A
D0=(5)LEVEL.DATA A=DAT0.A D0=A 
LC 500 B=C.X 
LC 30
{
 A=DAT1 B 
 ?C#A.B { A=0.B }
 DAT0=A B 
 D0+2 D1+2
 B-1.X UPNC
}

GOSUBL CL_LIFT
GOSUBL CLEAR.STABLE
CLRST

A=0.A 
D0=(5)FLAG01 DAT0=A 4
D0=(5)SCROL.COUNTER DAT0=A.P

% VARIABLE ANIM 
D0=(5)M.ANIM DAT0=A.B
D0=(5)T.ANIM DAT0=A.B

% VARIABLE CLIP MARIO
D0=(5)MCLIPH DAT0=A.B
D0=(5)MCLIPB DAT0=A.B

% FPS 
LA(2)#04
D0=(5)TICK  DAT0=A.B
D0=(5)TICK.COUNTER DAT0=A.B

%INITIALIZE DISPLAY
GOSUBL DISP.COL.D
GOSUBL DISP.LEVEL
GOSUBL DISP.PANEL
GOSUBL VIES
GOSUBL COINS
GOSUBL STAGES
GOSUBL FLIP

%MAIN GAME LOOP
{
 GOSUBL FLAGS
 GOSUBL LIFTS
 GOSUBL MARIO
 GOSUBL SPRITES
 GOSUBL FLIP

 LC(5)#200 { C-1.A UPNC }
   
 LC 010 GOSBVL =KEY
 ?CBIT=1.0 EXIT
 UP
}
*STOP
{ GOSUBL KEYS UPC }
GOSUBL RESET.CONTER
GOLONG PRESENTATION

*QUIT
P=0 SETHEX
%END GAME BACK RPL    
{ GOSUBL KEYS UPC }
LC 37
D0=(5)HEADERADD DAT0=C.P

%LES INDICATEURS      
%D1(5)=0010C A=DAT1.P ABIT=1.3 DAT1=A.P

%LA MEMOIRE VIDEO     
D0=(5)ECRAN A=DAT0.A
D0=(5)SCREENADD DAT0=A.A
%INTON2
INTON
LOADRPL

*MARIO
%DECALAGE DES OBJETS
ST=0.7

% MARIO�BACK-BUFFER   
D0=(5)MCLIPB
C=DAT0.B D=C.B

% READ SPRITE 
A=R2.A C=0.A
D1=(5)M.ANIM C=DAT1.B
C+C.A C+C.A A+C.A
% SET CLIP UP   
C=0.A
D1=(5) MCLIPH C=DAT1.B
B=C.A CSL.A C+B.A
C+C.A A+C.A
R4=A.W

LC 09
?B<C.B
{
 GOTO BIG_CLIP
}
C-B.B B=C.B

% SET CLIP DOWN   
C=D.B
?C>=B.B GOYES BIG_CLIP
B-C.B

A=0.A C=0.A
D0=(5)MX A=DAT0.B
D0=(5)MY C=DAT0.B
GOSUBL DISP.A.C.R4.B

*BIG_CLIP

%MOVEMENTS FROM KEYS  
GOSUBL TESTD
GOSUBL TESTG
%NO MOVE�STAND-BY     
GOSUBL KEYS
SKIPC
{
 A=0.B
 D0=(5)M.ANIM DAT0=A.B
}
% JUMPING 
LC 040 GOSBVL =KEY
?CBIT=0.4
{
 %DEJA PRESSED 
 ?ST=1.2 EXIT
 ST=1.2
 %DEJA ON AIR  
 ?ST=1.0 EXIT
 ?ST=1.3 EXIT

 ST=1.0
 %SAUT OU CHUTE
 ST=1.1
 A=0.B
 D0=(5)MJUMP DAT0=A.B
}
SKELSE
{
 ST=0.2
}
%ON GERE LE SAUT/CHUTE
?ST=1.0
{
 ?ST=1.3 GOYES AC
 GOSUBL SOL
 SKIPC
 {
  *AC
  ST=1.0
  %SAUT OU CHUTE
  ST=0.1
  LA 08
  D0=(5)MJUMP DAT0=A.B
 }
}
SKELSE
{
 GOSUBL JUMPING
}
% TEST LOST %%%%%%%%%%
{
 D0=(5)MCLIPB A=DAT0.B
 LC 09
 ?A<C.B EXIT
 GOLONG MLOST
}
RTN

*FLIP
% BACK-BUFFY�FRONT-BUFY
% WAIT VBL
% CLEAR NEW BACK-BUFFY 
% FLIP SCREEN POINTERS

D0=(5)SCREENADD D1=(5)HEADERADD


A=0.W  { A=DAT1.6 ?A#0.W UP }
C=R1.W DAT0=C.A

D0=(5)LEVEL.SURFACE A=DAT0.A D1=A
A=R0.W D0=A
AR1EX.A R0=A.W
LC 3F
{
 A=DAT1.W DAT0=A.W
 D0+16 D1+16
 A=DAT1.10 DAT0=A.10
 D0+18 D1+18
 C-1.B UPNC
}
RTN

*JUMPING
%MARIO SE POSE?
?ST=1.1
{
 ?ST=1.3 EXIT
 GOSUBL SOL EXITNC
 ST=0.0
 % REAJUSTE MY
 GOSUBL FIXSOL
 RTN
}
SKELSE
{
%MARIO SE COGNE? 
 ?ST=1.3 EXIT
 GOSUBL CIEL
 EXITNC
 ST=0.0
 % REAJUSTE MY
 GOSUBL FIXCIEL
 RTN
}
% EQS VALUES 
SKUB
{
% $/05 $/05 $/04 $/03 $/03 $/02 $/01 $/01 $/01 $/00 $/00 $/00
 $/04 $/03 $/03
 $/03 $/02 $/02
 $/02 $/02 $/01
 $/01 $/01 $/00

}
C=RSTK A=0.A
D0=(5)MJUMP A=DAT0.B
A+A.A C+A.A D0=C
C=0.A C=DAT0.B
%MOVE SPRITE          
D0=(5)MY A=DAT0.B
?ST=1.1
{
 D=C.B
 D1=(5)MCLIPH C=DAT1.B
 ?C=0.B
 {
  ?C>D.B
  {
   C=0.B DAT1=C.B
   D-C.B C=D.B
   A+C.B DAT0=A.B  
  }
  SKELSE
  {
   C-D.B DAT1=C.B 
  }
 }
 SKELSE
 {
  C=D.B
  A+C.B
 }
}
SKELSE
{
 ?C>A.B
 {
  A-C.B
 }
 SKELSE
 {
  D1=(5)MCLIPH A=DAT1.B
  A+C.B DAT1=A.B
  A=0.B
 }
}
%CLIPPING UP&DOWN 
LC 40 ?A<=C.B
{ A=C.B }
LC 36 ?A<=C.B
{
 B=C.B C=A.B
 C-B.B
 D1=(5)MCLIPB DAT1=C.B
}
DAT0=A.B
%UPDATE JUMP
D0=(5)MJUMP A=DAT0.B
%SAUT OU CHUTE
?ST=0.1
{
 LC(2)#11 ?A#C.B
 { ST=0.0 }
 SKELSE
 { A+1.B DAT0=A.B }
}
SKELSE
{
 ?A=0.B ->{
  %PAS DE SOL � CHUTE
  ?ST=1.3 EXIT
  GOSUBL SOL   EXITNC
  ST=0.0
  % REAJUSTE MY
  GOSUBL FIXSOL
 }
 SKELSE
 {
  A-1.B DAT0=A.B
 }
}
RTN
 
*MLOST
C=RSTK C=RSTK
GOSUBL FLIP

%ON SE REMET AU DEBUT
A=0.A C=0.A
D1=(5)LEVEL.DATA
D0=(5)POSX A=DAT0.X
LC(3)$40 ?A<C.X
{
 A=0.A D1=(5)LEVEL.DATA
 D0=(5)POSX A=DAT0.X
 A+A.A C=DAT1.A
 C-A.A DAT1=C.A
 GOSUBL RESET.1
}
SKELSE
{
 A=0.A D1=(5)LEVEL.DATA
 D0=(5)POSX A=DAT0.X
 A+A.A C=DAT1.A
 C-A.A DAT1=C.A
 GOSUBL RESET.1
}
D0=(5)VIE A=DAT0.B
?A#0.B ->{
 A-1.B
 DAT0=A.B
}
SKELSE
{
 %GAME-OVER
 GOLONG STOP
}
GOLONG REPLAY

*DISP.LEVEL
D0=(5)LEVEL.SURFACE A=DAT0.A
R3=A.W

LC(2)#13 D=C.B % X
LC(2)#08 B=C.B % Y

D0=(5)LEVEL.DATA A=DAT0.A D0=A
CD0EX RSTK=C D0=C

*BCL
A=0.A A=DAT0.B
%SI CEST MARIO 
LC(2)#25 ?A#C.B
{
 LA(2)#13 C=D.B A-C.B
 ASL.A ASRB.A
 D0=(5)MX DAT0=A.B

 LA(2)#08 C=B.B A-C.B
 ASL.A ASRB.A A-2.B
 D0=(5)MY DAT0=A.B
 A=0.A
 GOTO NODISP
}
%SI CEST UNE TORTUE 
LC(2)#26 ?A#C.B
{
 LA(2)#1
 LC(3)$264
 GOSUBL ADDOBJET

 A=0.A
 GOTO NODISP
}
%SI CEST UN KOOPA
LC(2)#44 ?A#C.B
{
 LA(2)#2
 LC(3)$270
 GOSUBL ADDOBJET

 A=0.A
 GOTO NODISP
}
%SI CEST UN LIFT
LC(2)#35 ?A#C.B
{
 GOSUBL ADD_LIFT
 A=0.A
 GOTO NODISP
}

*NODISP
D1=(5)CUBES C=DAT1.A
ASL.A A+A.A
C+A.A D1=C

A=R3.A D0=A
LC 7
{
 A=DAT1.B DAT0=A.B
 D0+34 D1+4 C-1.P
 UPNC
}
*NDISP
A=R3.A A+2.A R3=A.W
C=RSTK C+2.A RSTK=C
D0=C

D-1.B
?D#0.B ->{ GOTO BCL }

LC(2)#13 D=C.B

C=RSTK
LA 00140 C+A.A
C-16.A C-10.A
RSTK=C D0=C

A=R3.A A-16.A A-10.A
LC 00110 A+C.A R3=A.W

B-1.B ?B#0.B ->{ GOTO BCL }
C=RSTK
RTN

*DISP.COL.D

D0=(5)LEVEL.SURFACE C=DAT0.A
C+26.A D=C.A

LC(2)#8 B=C.B % Y

D0=(5)LEVEL.DATA A=DAT0.A
A+26.A R4=A.W
{
 C=R4.A D0=C
 A=0.A A=DAT0.B

 %TORTUE ?
 LC(2)#26 ?A#C.B
 {
  LA(2)#1
  LC(3)$264
  GOSUBL ADDOBJET2

  A=0.A
  GOTO NODISP2
 }
 %KOOPA ?
 LC(2)#44 ?A#C.B
 {
  LA(2)#2
  LC(3)$270
  GOSUBL ADDOBJET2

  A=0.A
  GOTO NODISP2
 }
 %SI CEST UN LIFT
 LC(2)#35 ?A#C.B
 {
  GOSUBL ADD2_LIFT
  A=0.A
  GOTO NODISP2
 }

 *NODISP2

 D1=(5)CUBES C=DAT1.A
 ASL.A A+A.A
 C+A.A D1=C
 C=D.A
 D0=C
 LC 7
 {
  A=DAT1.B DAT0=A.B
  D0+34 D1+4 C-1.P
  UPNC
 }

 LC 00110 D+C.A
 
 C=R4.A
 LA 00140 C+A.A
 R4=C.W
 B-1.B ?B=0.B { UP2 }
}
RTN

*SCROLG
% POUR LES OBJETS
ST=1.7
%UN POINTER SUR COLONE
D0=(5)LEVEL.SURFACE A=DAT0.A D0=A
LC 3F
{
 A=DAT0.W ASRB.W DAT0=A.15
 D0+15 A=DAT0.14 ASRB.W
 DAT0=A.13
 D0+19
 C-1.B UPNC
}
%ON COMPTE LES SCROLS 
D0=(5)SCROL.COUNTER A=DAT0.P
LC 7 ?A=C.P
{
 A+1.P DAT0=A.P
}
SKELSE
{ 
%UNE NOUVELLE COLONNE 
 A=0.P DAT0=A.P

 D0=(5)POSX A=DAT0.X
 LC(3)$92 ?A<C.X
 {
  ST=1.4
  D0=(5)SCROL.COUNTER
  LC 8 DAT0=C.P
 }
 SKELSE
 {
  A+1.X DAT0=A.X
  D0=(5)LEVEL.DATA A=DAT0.A
  A+2.A DAT0=A.A
 }
 GOSUBL DISP.COL.D
}
RTN

*DISP.PANEL
C=R2.A C+26.A D1=C
D=C.A 
A=R0.A A+26.A D0=A
LC 3F
{
 A=DAT1.8 DAT0=A.8
 D0+34 D1+34
 C-1.B UPNC
}
C=D.A D1=C
A=R1.A
A+16.A A+10.A D0=A
LC 3F
{
 A=DAT1.8 DAT0=A.8
 D0+34 D1+34
 C-1.B UPNC
}
RTN

*NUMBER.AC
?C=0.P RTNYES

% A/B=NUMBER C/D=SIZE 
% R4.A = POS          

B=A.W
D=C.P
C=0.A C=D.P C-1.A
A=R4.A A+C.A R4=A.W
%FONT DS TABLE SPRITES
A=R2.A
LC 00176 A+C.A
R3=A.W

{
 ?D=0.P EXIT
 C=R3.A
 A=0.A A=B.P
 C+A.A D1=C

 A=R4.A D0=A LC 5
 {
  A=DAT1.P DAT0=A.P
  D1+34 D0+34 C-1.P
  UPNC
 }
 C=R4.A C-1.A R4=C.W
 BSR.W D-1.P UP
}
RTN

*SPRITES
C=0.A R3=C.W
LC(1)#15
{
 RSTK=C
 C=R3.A
 GOSUBL SP.LOAD SKIPC
 {
  GOSUBL DISP.SPRITE
  C=R3.A 
  GOSUBL SP.SAVE
 }
 C=R3.A C+11.A R3=C.W
 C=RSTK ?C=0.P EXIT
 C-1.P
 UP
}
RTN

*LIFTS
C=0.A R3=C.W
LC(1)LMAX
{
 RSTK=C
 C=R3.A
 GOSUBL LOAD_L SKIPC
 {
  GOSUBL LIFT
  C=R3.A 
  GOSUBL SAVE_L
 }
 C=R3.A C+6.A R3=C.W
 C=RSTK ?C=0.P EXIT
 C-1.P
 UP
}
RTN

*DISP.A.C.R4.B
D=C.A
C=B.B RSTK=C
B=A.A
C=D.A
% D0 POINTER ON SCREEN
A=C.A CSL.A C+A.A
C+C.A
A=R1.A A+C.A C=B.A
D=C.A CSRB.A CSRB.A
A+C.A D0=A
% D1 POINTER ON SPRITE
A=R4.A D1=A
% AFFICHAGE SPRITE  
C=RSTK B=C.B
{
 D1+2

 A=0.X
 A=DAT1.B
 C=D.P
 ?CBIT=1.0 ->{ A+A.X }
 ?CBIT=1.1 ->{ A+A.X A+A.X }

 A=-A-1.X
 C=DAT0.X
 C&A.X
 RSTK=C
 D1-2

 A=0.X
 A=DAT1.B
 C=D.P
 ?CBIT=1.0 ->{ A+A.X }
 ?CBIT=1.1 ->{ A+A.X A+A.X }

 C=RSTK
 A!C.X
 DAT0=A.X
 D0+34 D1+34
 B-1.P UPNC
}
RTN

*CLEARED
C=RSTK C=RSTK C=RSTK
D0=(5)STAGE A=DAT0.X
A+1.X DAT0=A.X

D0=(5)STACK A=DAT0.A
A+5.A DAT0=A.A
GOLONG NEXTUP

*ADD_LIFT
%FIND PLACE
D0=(5)@LIFT
A=DAT0.A D0=A

C=0.P
{
 LA(1)LMAX
 ?C=A.P RTNYES
 A=DAT0.P ?A=0.P EXIT
 D0+6 C+1.P UP
}

LC 1 DAT0=C.P D0+1
%CALCUL POSITION

LA(2)#13 C=D.B A-C.B
ASL.A ASRB.A
DAT0=A.B
D0+2
LA(2)#08 C=B.B A-C.B
ASL.A ASRB.A 
DAT0=A.B
RTN

*ADD2_LIFT
%FIND PLACE
D0=(5)@LIFT
A=DAT0.A D0=A

C=0.P
{
 LA(1)LMAX
 ?C=A.P RTNYES
 A=DAT0.P ?A=0.P EXIT
 D0+6 C+1.P UP
}

LC 1 DAT0=C.P D0+1
%CALCUL POSITION

LA(2)#13
ASL.A ASRB.A
DAT0=A.B D0+2

LA(2)#8 C=B.B A-C.B
ASL.A ASRB.A
DAT0=A.B
RTN

*DISP.SPRITE
?ST=0.7 GOYES NDT.2 
%ON SCROL LE SPRITE
D0=(5)SX A=DAT0.B
?A#0.B
{
 ST=0.5 % DEAD SPRITE
}
SKELSE
{
 A-1.B DAT0=A.B
}
*NDT.2

C=R3.A
D0=(5)STABLE A=DAT0.A
A+C.A D0=A D0+1 A=0.A
A=DAT0.B A-1.A
C=A.A A+A.A A+C.A A+A.A

SKUBL {
GOLONG OBJ.TORTLE 
GOLONG OBJ.KOOPA
GOLONG OBJ.CHAMP.UP
GOLONG OBJ.STAR.UP
GOLONG OBJ.HEART.UP

} C=RSTK C+A.A PC=C
*FIN

RTN

*SP.LOAD
D0=(5)STABLE A=DAT0.A
A+C.A D0=A A=DAT0.P
?A#0.P
{
 ST=0.5 RTNSC
}
ST=1.5

ST=0.9 ST=0.10
{
 LC 1 ?A#C.P { ST=0.6 EXIT2 }
 LC 2 ?A#C.P { ST=1.6 EXIT2 }
 LC 3 ?A#C.P { ST=1.9 EXIT2 }
 LC 4 ?A#C.P { ST=0.6 ST=1.9 ST=1.10 EXIT2 }
 LC 5 ?A#C.P { ST=1.6 ST=1.9 ST=1.10 EXIT2 }
}
D0+3 %+1 %TYPE %+2 %DATA
A=0.A
A=DAT0.X R4=A.W
D0+3
A=DAT0.B D0+2
D1=(5)SX DAT1=A.B

A=DAT0.B D0+2
D1=(5)SY DAT1=A.B 

A=DAT0.P
?ABIT=0.2 { ST=0.8 }
SKELSE { ST=1.8 }
RTNCC

*SP.SAVE
D0=(5)STABLE A=DAT0.A
A+C.A D0=A

?ST=1.5
{
 %SPRITE DEATH
 C=0.P
}
SKELSE
{
 ?ST=1.6
 {
  LC 1
 }
 SKELSE
 {
  LC 2
 }
 %MODE CARAPACE
 ?ST=1.10 ->{ C+3.P EXIT2 }
 ?ST=1.9 ->{ LC 3 }
}
DAT0=C.P
D0+6 %D0+1 D0+2 D0+3

D1=(5)SX A=DAT1.B
DAT0=A.B D0+2

D1=(5)SY A=DAT1.B
DAT0=A.B D0+2

A=DAT0.P
?ST=0.8 ->{ ABIT=0.2 }
SKELSE { ABIT=1.2 }
DAT0=A.P
RTN

*CL_LIFT
D0=(5)@LIFT
A=DAT0.A D0=A
C=0.W
LA(1)LMAX
{
 ?A=0.P EXIT
 A-1.P
 DAT0=C.6 D0+6
 UP
}
RTN

*TORTLE_HIT
?ST=1.9
{
 %APPLATIE
 ST=1.9
}
SKELSE
{
 ST=1.10
 %POUSSEE: SENS ?
 D0=(5)SX A=DAT0.B
 D0=(5)MX C=DAT0.B
 ?A>C.B
 {
  ST=0.6
 }
 SKELSE
 {
  ST=1.6
 }
}
%MARIO REBONDIT
?ST=1.3 RTNYES
ST=1.0
ST=1.1
LA 02
D0=(5)MJUMP DAT0=A.B
RTN

*LOST_LIFE
?ST=1.3 RTNYES
LC 08000 { C-1.A UPNC }
ST=1.3

ST=1.0
ST=1.1
A=0.B
D0=(5)MJUMP DAT0=A.B
RTN

*KEYS
LC 1FF
GOSBVL =KEY
?C=0.B { RTNSC }
RTNCC

*SOL
A=0.A C=0.A
D0=(5)MCLIPH C=DAT0.B
?C=0.B
{
% LA(2)#8 ?C<=A.B
% { A=0.B EXIT2 }
% A-C.B
 A=0.B
}
SKELSE
{
 D0=(5)MY A=DAT0.B
}
A+2.B
C=A.B
ASRB.A ASRB.A ASRB.A
ASL.A ASRB.A C-A.A
LA(2)#5 ?C>A.B ->{ RTNCC }

ST=1.12
ST=0.11

D0=(5)MY A=DAT0.B
LC(2)#54 ?A>=C.B ->{ RTNCC }

%D0=(5)MCLIPB A=DAT0.B
%?A=0.B { RTNCC }

A=0.A
D0=(5)MCLIPH A=DAT0.B
LC 0A ?A<=C.B { RTNCC }
LC(5)#10 C-A.A

A=0.A D0=(5)SCROL.COUNTER
A=DAT0.P A+5.A

B=A.A D=C.A

% (Y/8)*320+(X/8)*2 
C=0.A
D0=(5)MY C=DAT0.B
C+D.A

CSRB.A CSRB.A CSRB.A
CSL.A A=C.A CSL.A
A+A.A A+A.A C+A.A

A=0.A
D0=(5)MX A=DAT0.B
A+B.A
ASRB.A ASRB.A ASRB.A
A+A.A C+A.A

% ON LIT LE CUBE   
D0=(5)LEVEL.DATA A=DAT0.A
A+C.A D0=A R4=A.A
A=0.A A=DAT0.B

%SUR UN PIC ?
 %BOG DES PICS
 AR4EX.A 
 LC(5)#320 A-C.A
 D0=A A=DAT0.B
 LC(2)#04 ?A#C.B
 {
  GOSUBL LOST_LIFE
  RTNCC
 }
 SKELSE
 {
  AR4EX.A
 }

LC(2)#03 ?A#C.B
{
 %MARIO REBONDIT
 ?ST=1.3 RTNYES
 ST=1.0
 ST=1.1
 A=0.B %LA 04
 D0=(5)MJUMP DAT0=A.B
 RTNSC
}
%PIECE
LC(2)#07 ?A#C.B { GOLONG COINUP }

D1=(5)CUBES C=DAT1.A
ASL.A A+A.A
C+A.A D1=C
D1+2 A=DAT1.B

?ABIT=1.1 ->{ RTNSC }
RTNCC


*FIXSOL
 D0=(5)MY A=DAT0.B

% A+3.B %% ...

 A+2.B
 ASRB.B ASRB.B ASRB.B
 ASL.A ASRB.A
LC(2)#02 ?A<C.B
{
 A-2.B
}
SKELSE
{
 D1=(5)MCLIPH DAT1=C.B
 A=0.B
}
DAT0=A.B
RTN

*FIXCIEL
 D0=(5)MY A=DAT0.B
 A+8.B
 ASRB.B ASRB.B ASRB.B
 ASL.A ASRB.A
 A-2.B
 DAT0=A.B
RTN

*MURD
ST=1.12
ST=0.11

A=0.A D0=(5)SCROL.COUNTER
A=DAT0.P A+8.A

LC(5)#03

B=A.A D=C.A

% (Y/8)*320+(X/8)*2 
C=0.A
D0=(5)MY C=DAT0.B
C+D.A
CSRB.A CSRB.A CSRB.A
CSL.A A=C.A CSL.A
A+A.A A+A.A C+A.A

A=0.A
D0=(5)MX A=DAT0.B
A+B.A %A+4.A
ASRB.A ASRB.A ASRB.A
A+A.A C+A.A

% ON LIT LE CUBE   
D0=(5)LEVEL.DATA A=DAT0.A
A+C.A D0=A
A=0.A A=DAT0.B

LC(2)#07 ?A#C.B { GOLONG COINUP }

D1=(5)CUBES C=DAT1.A
ASL.A A+A.A
C+A.A D1=C
D1+2 A=DAT1.B

?ABIT=1.3 ->{ RTNSC }
RTNCC
%GOLONG TESTING_UP

*MURG
ST=1.12
ST=1.11

D0=(5)MX A=DAT0.B
LC 01 ?A<C.B ->{ RTNCC }

A=0.A D0=(5)SCROL.COUNTER
A=DAT0.P

LC(5)#03

B=A.A D=C.A

% (Y/8)*320+(X/8)*2 
C=0.A
D0=(5)MY C=DAT0.B
C+D.A
CSRB.A CSRB.A CSRB.A
CSL.A A=C.A CSL.A
A+A.A A+A.A C+A.A

A=0.A
D0=(5)MX A=DAT0.B
A+B.A A-1.A
ASRB.A ASRB.A ASRB.A
A+A.A C+A.A

% ON LIT LE CUBE   
D0=(5)LEVEL.DATA A=DAT0.A
A+C.A D0=A
A=0.A A=DAT0.B

LC(2)#07 ?A#C.B { GOLONG COINUP }

D1=(5)CUBES C=DAT1.A
ASL.A A+A.A
C+A.A D1=C
D1+2 A=DAT1.B

LC(2)#07 ?A#C.B { GOLONG COINUP }

?ABIT=1.2 ->{ RTNSC }
RTNCC
%GOLONG TESTING_UP

*SOL_T
ST=0.12
ST=0.11

LC(5)#08

A=0.A D0=(5)SCROL.COUNTER
A=DAT0.P A+4.A

B=A.A D=C.A

% (Y/8)*320+(X/8)*2 
C=0.A
D0=(5)SY C=DAT0.B
C+D.A

CSRB.A CSRB.A CSRB.A
CSL.A A=C.A CSL.A
A+A.A A+A.A C+A.A

A=0.A
D0=(5)SX A=DAT0.B
A+B.A %A+4.A
ASRB.A ASRB.A ASRB.A
A+A.A C+A.A

% ON LIT LE CUBE   
D0=(5)LEVEL.DATA A=DAT0.A
A+C.A D0=A 
A=0.A A=DAT0.B

D1=(5)CUBES C=DAT1.A
ASL.A A+A.A
C+A.A D1=C
D1+2 A=DAT1.B

?ABIT=1.1 ->{ RTNSC }
RTNCC
%GOLONG TESTING_DW

*MURD_T
ST=0.12
ST=0.11

A=0.A D0=(5)SCROL.COUNTER
A=DAT0.P A+8.A

LC(5)#00

B=A.A D=C.A

% (Y/8)*320+(X/8)*2 
C=0.A
D0=(5)SY C=DAT0.B
C+D.A
CSRB.A CSRB.A CSRB.A
CSL.A A=C.A CSL.A
A+A.A A+A.A C+A.A

A=0.A
D0=(5)SX A=DAT0.B
A+B.A %A+4.A
ASRB.A ASRB.A ASRB.A
A+A.A C+A.A

% ON LIT LE CUBE   
D0=(5)LEVEL.DATA A=DAT0.A
A+C.A D0=A
A=0.A A=DAT0.B

D1=(5)CUBES C=DAT1.A
ASL.A A+A.A
C+A.A D1=C
D1+2 A=DAT1.B

?ABIT=1.3 ->{ RTNSC }
RTNCC
%GOLONG TESTING_UP

*MURG_T
ST=0.12
ST=0.11

D0=(5)SX A=DAT0.B
LC 01 ?A<C.B ->{ RTNCC }

A=0.A D0=(5)SCROL.COUNTER
A=DAT0.P

LC(5)#00

B=A.A D=C.A

% (Y/8)*320+(X/8)*2 
C=0.A
D0=(5)SY C=DAT0.B
C+D.A
CSRB.A CSRB.A CSRB.A
CSL.A A=C.A CSL.A
A+A.A A+A.A C+A.A

A=0.A
D0=(5)SX A=DAT0.B
A+B.A A-1.A
ASRB.A ASRB.A ASRB.A
A+A.A C+A.A

% ON LIT LE CUBE   
D0=(5)LEVEL.DATA A=DAT0.A
A+C.A D0=A 
A=0.A A=DAT0.B

D1=(5)CUBES C=DAT1.A
ASL.A A+A.A
C+A.A D1=C
D1+2 A=DAT1.B

?ABIT=1.2 ->{ RTNSC }
RTNCC
%GOLONG TESTING_UP

*CIEL
ST=1.12
ST=0.11

D0=(5)MCLIPH A=DAT0.B
?A=0.B { RTNCC }

A=0.A D0=(5)SCROL.COUNTER
A=DAT0.P A+4.A
C=0.A
B=A.A D=C.A

% (Y/8)*320+(X/8)*2 
C=0.A
D0=(5)MY C=DAT0.B
C+D.A

CSRB.A CSRB.A CSRB.A
CSL.A A=C.A CSL.A
A+A.A A+A.A C+A.A

A=0.A
D0=(5)MX A=DAT0.B
A+B.A
ASRB.A ASRB.A ASRB.A
A+A.A C+A.A

% ON LIT LE CUBE   
D0=(5)LEVEL.DATA A=DAT0.A
A+C.A D0=A
A=0.A A=DAT0.B

LC(2)#02 ?A#C.B
{
 %on met un bloc banal
 LC(2)#5 DAT0=C.B 
 GOLONG ADD.CHAMP
} 
LC(2)#07 ?A#C.B { GOLONG COINUP }

D1=(5)CUBES C=DAT1.A
ASL.A A+A.A
C+A.A D1=C
D1+2 A=DAT1.B

?ABIT=1.0 ->{ RTNSC }
RTNCC
%GOLONG TESTING_UP

*VIES
 A=R0.A
 LC 00193 A+C.A
 R4=A.W
 D0=(5)VIE A=DAT0.B
 LC 2
 GOSUBL NUMBER.AC

 A=R1.A
 LC 00193 A+C.A
 R4=A.W
 D0=(5)VIE A=DAT0.B
 LC 2
 GOLONG NUMBER.AC

*COINS
 A=R0.A
 LC 0045C A+C.A
 R4=A.W
 D0=(5)COIN A=DAT0.X
 LC 3
 GOSUBL NUMBER.AC

 A=R1.A
 LC 0045C A+C.A
 R4=A.W
 D0=(5)COIN A=DAT0.X
 LC 3
 GOLONG NUMBER.AC

*STAGES
 A=R0.A
 LC 00726 A+C.A
 R4=A.W
 D0=(5)STAGE A=DAT0.X
 LC 3
 GOSUBL NUMBER.AC

 A=R1.A
 LC 00726 A+C.A
 R4=A.W
 D0=(5)STAGE A=DAT0.X
 LC 3
 GOLONG NUMBER.AC

*COINUP
%SORTUE ?
?ST=1.12 { RTNCC }

%CLS IN STRING
A=0.B DAT0=A.B
%CLEAR COIN
C=0.A
D0=(5)MY C=DAT0.B
C+D.A

CSRB.A CSRB.A CSRB.A
CSL.A CSRB.A

A=C.A CSL.A C+A.A
C+C.A
D0=(5)LEVEL.SURFACE A=DAT0.A
A+C.A C=0.A
D0=(5)MX C=DAT0.B
C+B.A

?ST=0.11
{
 C-1.A ST=0.11
}

CSRB.A CSRB.A CSRB.A
CSL.A CSRB.A

B=A.A
D0=(5)SCROL.COUNTER 
A=0.A A=DAT0.P
C-A.A D=C.P
A=B.A

CSRB.A CSRB.A A+C.A
D0=A

SKUB {
$FF00
} C=RSTK D1=C

 LC 7 B=C.P
{
 A=DAT1.X
 C=D.P
 ?CBIT=0.0 { A+A.X }
 ?CBIT=0.1 { A+A.X A+A.X }
 A=-A-1.X
 C=DAT0.X
 A&C.X
 DAT0=A.X
 D0+34
 B-1.P UPNC
}

D0=(5)COIN A=DAT0.X
LC 99
?A<C.B
{
 A=0.X DAT0=A.X
 D0=(5)VIE A=DAT0.B
 SETDEC A+1.B SETHEX
 DAT0=A.B
 GOSUBL COINS
 GOSUBL VIES
 RTNCC
} 
SETDEC A+1.X SETHEX

DAT0=A.X
GOSUBL COINS
RTNCC

*RESET.CONTER
%VIE
LA 04
D0=(5)VIE DAT0=A.B
%COIN
A=0.X
D0=(5)COIN DAT0=A.X
*RESET.1
%SCROLL X
A=0.X
D0=(5)POSX DAT0=A.X
RTN

*PRESENTATION
A=0.A
D0=(5)START DAT0=A.A

SKUBL {
$3DF3000000000000FFF00000000C100060FFCFFF100000000CFF300000000C108F30FB0FFFFFF308F10F70C70E3F700EFFCF10C508FFFF700F1EF3F10FFBFFFFFF0E7000F500EFFFFF00EFF1EFFF100FF004EF700002000008FFFFF7002EF10FFFFFFFF1000081000000FFFFF000140FFFF10FFFF100007000000000000008080FFFF1000E200000000000000000000400100000000F500000000000000000000200200000000F900000000000000000000100400000008F3100000000000008FFFFFFFFFFFF30008F3200000000000008FFFFFFFFFFFF3070CF7407000000000008FFFFFFFFFFFF3070CF78070000000000083F970E187E3E3010CF70110000000040083E836C937E1C301060402100000000A008FFFFFFFFFFFF3010504041000000001108FFFFFFFFFFFF30184150810000000802083B930C187EC930BD4156B10000000404083F93FC937EC930FF415EF3000000020808FFFFFFFFFFFF3018404205000000010018FFFFFFFFFFFF301C70C709000000800028FFFFFFFFFFFF301C70C701100000400048FFFFFFFFFFFF305C404641200000200088FFFFFFFFFFFF305C4E4641400000100001000000000000085C4E4641000008000002000000000000441C4E4601000004000004000000000000821CFFF701000002000000C972072BFE1F011E000E010000010000002BE28E2B16B002260F1C800000800000000BE28FC976B70440000040000040000000CD728F881E1F0840CF70400000200000046F0EB888163800D0308160000010000002EB0EB888F6B700E01001600008E0783C1100000000000000C80F12600004E0783C98FFFFFFFFFFFF30C88F3260000240201948FFFFFFFFFFFF30C88F32600001F9FEFE7000000000000000C88F32600088E67D7C1000000000000000C88F32600040E88C7E3000000000000000C88F32600020A8F83F7000000000000000C88A22600010B9DC622000000000000000EF803EF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0700F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F00FFF0FFF0FFF0FFF0FFF0FFF0FFF0FFF070FFF0FFF0FFF0FFF0FFF0FFF0FFF0FFF070FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70F0FFF0FFF0FFF0FFF0FFF0FFF0FFF0FF70F0FFF0FFF0FFF0FFF0FFF0FFF0FFF01000F0FFF0FFF0FFF0FFF0FFF0FFF0FFF096300F0F0F0F0F0F0F0F0F0F0F0F0F0F0F8A200F0F0F0F0F0F0F0F0F0F0F0F0F0F0FA2200F0F0F0F0F0F0F0F0F0F0F0F0F0F0FE220DBFFFFFFFFFFFFF3FFFFFFFFFFFFFF306099CF30EFFFFFFFFFFFFFFFFFDFFFFF9F30D90FF0000CF7060F7C30F1C08FF500CF10E608FFFF70F00EF3F100000000040E70003400EFFFFF00EFF1EFF1000FF004EF700062000008FFFFF7000EF10FFFFFFFF10000F1000000FFFFF000000FFFF10FFBF100007000000000000000000FFFF1000A00000000000000000000000000000000071000000000000000000000000000000007100000000000000000000000000000008F200000000000000000000000000000008F20000000000000000000000000000070CF5007000000000000C068F1E781C10070CF40070000000000002194021842360010CF70010000000000002A82649352140010404001000000000000248294925AC900104040010000000000002192F4994A490010415001000000000000EFFEF7FFCB7F00BD4156B1000000000000E5FEF7FFDBFF00FF415EF1000000000000E1FE97FED3F700FF404EF1000000000000E1FE97FED3F700FF70CFF1000000000000C06C036C81C100FF70CFF100000000000000000000000000FF504FF100000000000000000000000000FF6ECEF100000000000000000000000000FF5E4FF1000000000008FFFFFFFFFFFF30FF6ECEF1000000000008FFFFFFFFFFFF30FFFFFFF1000000000008FD7BF7BBFEDF20FFFFFFF1000000000008BBCAF8ABD7AE30EFFFFFF0000000000008FBEAFFED77B730CFFFFF70000000000008F97BFFEEDFDF20CFFFFF7000000000000878EFBEEED7BF20CFBAAF70000000000008FBEFBEEEF6B730CF555F700000E0783C18FFFFFFFFFFFF30CFAFBE700000E0783C18FFFFFFFFFFFF30CFDA6F70000040201908FFFFFFFFFFFF30CFAFBE700000F9FEFE7000000000000000CFDA6F700008E67D7C1000000000000000CFAAAE700000E88C763000000000000000CFDF7F700000A8F83F7000000000000000CFAFBE700000B9DC622000000000000000EFDF6FF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0700F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F00F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0700F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F00FFF0FFF0FFF0FFF0FFF0FFF0FFF0FFFF70FFF0FFF0FFF0FFF0FFF0FFF0FFF0FF1000FFF0FFF0FFF0FFF0FFF0FFF0FFF0FF9630FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A20FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA220FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE220
%INCLUDE PRE
} C=RSTK
%C+20.A
R4=C.W

*PRES
A=0.W
D0=(5) $00128 % HEADERADD
{
 A=DAT0 6
 ?A#0.W UP
}
A=R4.A D1=A
GOSUBL AF
A=0.W
D0=(5) $00128  % HEADERADD
{
 A=DAT0 6
 ?A#0 W UP
}
A=R4.A
LC 00880 A+C.A D1=A
GOSUBL AF
A=0.W
D0=(5) $00128  % HEADERADD
{
 A=DAT0 6
 ?A#0 W UP
}
A=R4.A
LC 00880 A+C.A D1=A
GOSUBL AF

D0=(5)START A=DAT0.A
A+1.A DAT0=A.A
LC(5)#8000
?A#C.A
{
 A=R0.A LC(5)$72C
 A+C.A D0=A
 LC 8 A=0.W
 {
  DAT0=A.W D0+16
  DAT0=A.W D0+16
  DAT0=A.B
  C-1.P UPNC
 }
}
%TEST LA TOUCHE ENTER
LC 010 GOSBVL =KEY
?CBIT=0.4
{
 GOLONG REPLAY
}

%TEST LA TOUCHE DROP
LC 010 GOSBVL =KEY ?CBIT=0.0
{
 GOLONG QUIT 
}
GOTO PRES

*AF
A=R0.A D0=A LC 87
{
 A=DAT1.W DAT0=A.W
 D0+16 D1+16
 C-1.B UPNC
}
RTN

*LOAD_L
D0=(5)@LIFT
A=DAT0.A A+C.A D0=A
A=DAT0.P ?A#0.P
{
 ST=0.5 RTNSC
}
ST=1.5

LC 1 ?A#C.P { ST=0.6 }
LC 2 ?A#C.P { ST=1.6 }

D0+1 D1=(5)SX
A=DAT0.B DAT1=A.B
D0+2 D1=(5)SY
A=DAT0.B DAT1=A.B 
D0+2 A=DAT0.P

?A=0.P { ST=0.8 }
SKELSE { ST=1.8 }
RTNCC

*SAVE_L
D0=(5)@LIFT
A=DAT0.A A+C.A D0=A
?ST=1.5
{
 C=0.P
}
SKELSE
{
 ?ST=1.6
 {
  LC 1
 }
 SKELSE
 {
  LC 2
 }
}
DAT0=C.P
D0+1 D1=(5)SX
A=DAT1.B DAT0=A.B
D0+2 D1=(5)SY
A=DAT1.B DAT0=A.B 
D0+2
?ST=0.8 ->{ A=0.P } SKELSE { LA 1 }
DAT0=A.P
RTN

*LIFT
?ST=1.7 ->{
 %ON SCROL LE LIFT
 D0=(5)SX A=DAT0.B
 ?A#0.B
 {
  ST=0.5 % DEAD LIFT
 }
 SKELSE
 {
  A-1.B DAT0=A.B
 }
}

% READ SPRITE 
A=R2.A LC(5)$00374
A+C.A R4=A.W

LC 03 B=C.B

A=0.A C=0.A
D0=(5)SX A=DAT0.B
LC 60 ?A>C.B
{
 D0=(5)SY C=DAT0.B
 GOSUBL DISP.A.C.R4.B
}

% LOOK AROUND LIFT
ST=0.13
D0=(5)SX A=DAT0.B
D0=(5)MX C=DAT0.B
{
 C+6.B ?C<A.B EXIT
 A+11.B ?C>A.B EXIT
 D0=(5)SY A=DAT0.B
 D0=(5)MY C=DAT0.B
 C+10.B ?C<A.B EXIT
 C-4.B ?C>A.B EXIT
 {
  ?ST=1.1 EXIT
  ?ST=0.0 EXIT
  ?ST=1.3 EXIT
  ST=0.0
  GOSUBL FIXSOL
 }
 ST=1.13
}

% MOVE LIFT %%%%%%%%%%

?ST=0.8 RTNYES

?ST=0.6
{
 %VERS LA DROITE
 GOSUBL MURD_T
 SKIPNC
 {
  ST=0.6 EXIT2
 }
 D0=(5)SX A=DAT0.B
 LC(2)$FF
 ?A#C.B
 {
  ST=0.6 EXIT2
 }
 A+1.B DAT0=A.B

 ?ST=0.13 ->{ EXIT2 }

 C=ST RSTK=C %R4=C.X
 ST=0.7
 GOSUBL YD
 ?ST=0.7
 {
  GOSUBL LIFT.LEFT
  D0=(5)SX A=DAT0.B
  A-1.B DAT0=A.B
 }
 C=RSTK %C=R4.X
 ?ST=1.4 ->{ CBIT=1.4 }
 ST=C
}
SKELSE
{
 %VERS LA GAUCHE
 GOSUBL MURG_T
 SKIPNC
 {
  ST=1.6 EXIT2
 }
 D0=(5)SX A=DAT0.B
 ?A#0.B
 {
  ST=1.6 EXIT2
 }
 A-1.B
 DAT0=A.B

 ?ST=0.13 EXIT
 GOSUBL YG
}
RTN

*TESTD
%SI ON A PERDU 1 VIE
?ST=1.3 GOYES YD

LC 040 GOSBVL =KEY
?CBIT=1.0 { GOTO ND }
*YD
 ?ST=1.3 GOYES AH
 GOSUBL MURD
 SKIPNC { GOTO ND }
 *AH
 D0=(5)MX A=DAT0.B
 LC 40 ?A<C.B 
 {
  %ON EST ARRIVE !
  ?ST=1.4 GOYES E
  GOSUBL SCROLG
 }
 SKELSE
 {
  *E
  LC 5F ?A<C.B
  {
   GOLONG CLEARED
  }
  A+1.B DAT0=A.B
 }
 % ANIMATION DROITE   
 D0=(5)TICK.COUNTER A=DAT0.B
 ?A=0.B
 {
  A-1.B DAT0=A.B
 }
 SKELSE
 {
  D1=(5)TICK A=DAT1.B
  DAT0=A.B
  % FRAME 
  D0=(5)M.ANIM A=DAT0.B
  LC 04 ?A>=C.B
  { A+1.B }
  SKELSE
  { LA 01 }
  DAT0=A.B
 }
*ND
RTN

*TESTG
LC 040 GOSBVL =KEY
?CBIT=1.2 { GOTO NG }
*YG
 ?ST=1.3 GOYES AI
 GOSUBL MURG
 SKIPNC { GOTO NG }
 *AI
 D0=(5)MX A=DAT0.B
 ?A#0.B { GOTO NG }
 A-1.B DAT0=A.B
 % ANIMATION GAUCHE   
 D0=(5)TICK.COUNTER A=DAT0.B
 ?A=0.B
 {
  A-1.B DAT0=A.B
 }
 SKELSE
 {
  D1=(5)TICK A=DAT1.B
  DAT0=A.B
  % FRAME 
  D0=(5)M.ANIM A=DAT0.B
  LC 01 ?A<=C.B
  { A-1.B }
  SKELSE
  { LA 04 }
  DAT0=A.B
 }
*NG
RTN

*LIFT.LEFT

D0=(5)@LIFT
A=DAT0.A D0=A

C=0.P
{
 LA(1)LMAX
 ?C=A.P EXIT
 A=DAT0.P ?A=0.P
 {
  D0+1 A=DAT0.B
  ?A#0.B
  {
   A=0.P D0-1 DAT0=A.P
   EXIT2
  }
  A-1.B DAT0=A.B
  D0-1
 }
 D0+6 C+1.P UP
}

D0=(5)STABLE
A=DAT0.A D0=A

C=0.B
{
 LA(2)SMAX
 ?C=A.B EXIT
 A=DAT0.P ?A=0.P
 {
  D0+1
  D0+2 D0+3
  A=DAT0.B
  ?A#0.B
  {
   A=0.P D0-1
   D0-2 D0-3
   DAT0=A.P
   EXIT2
  }
  A-1.B DAT0=A.B
  D0-1 
  D0-2 D0-3
 }
 D0+11 C+1.B UP
}
RTN

*ADD.CHAMP
%met bloc banal

C=R1.A RSTK=C
D0=(5)LEVEL.SURFACE A=DAT0.A R1=A.W

A=R2.A
LC(5)$18A A+C.A R4=A.W

A=0.A C=0.A
D0=(5)MX A=DAT0.B

ASRB.A ASRB.A ASRB.A
ASL.A ASRB.A B=A.A

A=0.A C=0.A
D0=(5)SCROL.COUNTER C=DAT0.P
D0=(5)MX A=DAT0.B
C+A.A

LA(5)#8 C+4.A
%%%%% C modulo A %%%%%
{ ?C<A.A EXIT C-A.A UP }

A=0.A
D0=(5)MX A=DAT0.B
C-4.A A-C.A R3=A.W

LC(2)#7 B=C.B

C=0.A
D0=(5)MY C=DAT0.B
CSRB.A CSRB.A CSRB.A
CSL.A CSRB.A
GOSUBL DISP.A.C.R4.B
C=RSTK R1=C.W

LC(5)$41E R4=C.W

D0=(5)CRC A=DAT0.A
D0=A A=0.B
A=DAT0.P ASRB.P ASRB.P
?A=0.P RTNYES
A+2.P B=A.B
%LC(2)#3 B=C.B

A=R3.A

C=0.A
D0=(5)MY C=DAT0.B
C-8.A RTNC
CSRB.A CSRB.A CSRB.A
CSL.A CSRB.A
GOLONG ADDOBJ.A.C.B.R4
RTN

*CLEAR.STABLE
D0=(5)STABLE A=DAT0.A D0=A
LC(2)#15 A=0.W
{
 DAT0=A.11 D0+11
 C-1.B UPNC
}
RTN

*OBJ.TORTLE
% READ SPRITE 
A=R2.A C=R4.A A+C.A

%MODE CARAPACE
?ST=1.9 ->{ A+8.A }
SKELSE
{
 %GAUCHE OU DROITE
 ?ST=0.6 { A+4.A }
}
%C=0.A
%D1=(5)T.ANIM C=DAT1.B
%C+C.A C+C.A A+C.A
R4=A.W

LC 07 B=C.B

A=0.A C=0.A
D0=(5)SX A=DAT0.B
LC 60 ?A>C.B
{
 D0=(5)SY C=DAT0.B
 GOSUBL DISP.A.C.R4.B
}

% LOOK AROUND MARIO
D0=(5)SX A=DAT0.B
D0=(5)MX C=DAT0.B
{
 C+4.B ?C<A.B EXIT
 A+8.B ?C>A.B EXIT
 
 D0=(5)SY A=DAT0.B
 D0=(5)MCLIPH C=DAT0.B
 A+C.B
 D0=(5)MY C=DAT0.B

 C+8.B ?C<A.B EXIT
 C-8.B ?C>A.B EXIT
 
 C+6.B
 ?C<A.B
 {
  ?ST=1.0 GOYES AA2
  ?ST=1.9 ->{ ?ST=0.10 GOYES AA2 }
  %MARIO MORDU
  GOSUBL LOST_LIFE
  EXIT2
 }
 SKELSE
 {
  %TORTUE FRAPPEE
  *AA2
  GOSUBL TORTLE_HIT
 }
}

{
 ?ST=0.9 EXIT
 ?ST=1.10 EXIT
 RTN
}

?ST=1.10
{
 ?ST=0.8 RTNYES
}

?ST=0.6
{
 %VERS LA DROITE
 GOSUBL MURD_T
 SKIPNC
 {
  ST=0.6 EXIT2
 }
 D0=(5)SX A=DAT0.B
% LC 5F ?A<C.B
% {
%  ST=0.6 EXIT2
% }
 A+1.B
 DAT0=A.B
}
SKELSE
{
 %VERS LA GAUCHE
 GOSUBL MURG_T
 SKIPNC
 {
  ST=1.6 EXIT2
 }
 D0=(5)SX A=DAT0.B
 ?A#0.B
 {
  ST=1.6 EXIT2
 }
 A-1.B
 DAT0=A.B
}

?ST=0.10
{
 GOSUBL SOL_T
 SKIPC
 {
  D0=(5)SY A=DAT0.B
  LC 37 ?A>=C.B ->{
   ST=0.5 %DEATH
  }
  SKELSE
  {
   A+1.B DAT0=A.B
  }
 }
 GOTO CHUTE2
}
%PAS DE CHUTE
?ST=0.6
{
 GOSUBL SOL_T
 SKIPC
 {
  ST=0.6
 }
}
SKELSE
{
 GOSUBL SOL_T
 SKIPC
 {
  ST=1.6
 }
}
*CHUTE2

GOLONG FIN

*OBJ.KOOPA
% READ SPRITE 
A=R2.A C=R4.A
A+C.A R4=A.W

LC 07 B=C.B

A=0.A C=0.A
D0=(5)SX A=DAT0.B
LC 60 ?A>C.B
{
 D0=(5)SY C=DAT0.B
 GOSUBL DISP.A.C.R4.B
}

?ST=0.8 RTNYES

?ST=0.6
{
 %VERS LA DROITE
 GOSUBL MURD_T
 SKIPNC
 {
  ST=0.6 EXIT2
 }
 D0=(5)SX A=DAT0.B
 A+1.B DAT0=A.B
}
SKELSE
{
 %VERS LA GAUCHE
 GOSUBL MURG_T
 SKIPNC
 {
  ST=1.6 EXIT2
 }
 D0=(5)SX A=DAT0.B
 ?A#0.B
 {
  ST=1.6 EXIT2
 }
 A-1.B
 DAT0=A.B
}

% LOOK AROUND MARIO
D0=(5)SX A=DAT0.B
D0=(5)MX C=DAT0.B
{
 C+4.B ?C<A.B EXIT
 A+8.B ?C>A.B EXIT
 
 D0=(5)SY A=DAT0.B
 D0=(5)MCLIPH C=DAT0.B
 A+C.B
 D0=(5)MY C=DAT0.B

 C+8.B ?C<A.B EXIT
 C-8.B ?C>A.B EXIT
 
 C+3.B %C+6.B
 ?C<A.B
 {
  ?ST=1.0 GOYES AA3
  %MARIO MORDU
  GOSUBL LOST_LIFE
  EXIT2
 }
 SKELSE
 {
  %KOOPA FRAPPEE
  *AA3
%  GOSUBL TORTLE_HIT
  ST=0.5
 }
}

GOSUBL SOL_T
SKIPC
{
 D0=(5)SY A=DAT0.B
 LC 37 ?A>=C.B ->{
  ST=0.5 %DEATH
 }
 SKELSE
 {
  A+1.B DAT0=A.B
 }
}

GOLONG FIN

GOLONG FIN


*ADDOBJ.A.C.B.R4
D=C.A
C=B.B RSTK=C
B=A.A
C=D.A

%FIND PLACE
D0=(5)STABLE A=DAT0.A D0=A

C=0.B
{
 LA(2)SMAX
 ?C#A.B { C=RSTK RTN }
 A=DAT0.P ?A=0.P EXIT
 D0+11 C+1.P UP
}
%get this free field
LC 1 DAT0=C.P D0+1

%type=1 (tortle)
C=RSTK DAT0=C.B D0+2

%set data position
C=R4.A DAT0=C.X D0+3

%compute X position
A=B.B DAT0=A.B D0+2

%compute Y position
C=D.B DAT0=C.B D0+2

%set X&Y move
P=0 C=0.P DAT0=C.P
RTN

*ADDOBJET2

 D0=(5)STYPE DAT0=A.B
 D0=(5)SDATA DAT0=C.X

%compute X position
 LA(2)#13 
 ASL.A ASRB.A
 D0=(5)AX DAT0=A.B

GOTO NEXT.ADDOBJET

*ADDOBJET

 D0=(5)STYPE DAT0=A.B
 D0=(5)SDATA DAT0=C.X

%compute X position
 LA(2)#13 C=D.B A-C.B
 ASL.A ASRB.A
 D0=(5)AX DAT0=A.B

*NEXT.ADDOBJET
%compute Y position
 LA(2)#08 C=B.B A-C.B
 ASL.A ASRB.A
 D0=(5)AY DAT0=A.B

%FIND PLACE
D0=(5)STABLE A=DAT0.A
D0=A C=0.B
{
 LA(2)SMAX
 ?C=A.B RTNYES
 A=DAT0.P ?A=0.P EXIT
 D0+11 C+1.B UP
}
%get this free field
LC 1 DAT0=C.P D0+1

%type=
D1=(5)STYPE C=DAT1.B
DAT0=C.B D0+2

%set data position
D1=(5)SDATA C=DAT1.X
DAT0=C.X D0+3

%compute X position
D1=(5)AX C=DAT1.B
DAT0=C.B D0+2

%compute Y position
D1=(5)AY C=DAT1.B
DAT0=C.B D0+2

%set X&Y move
P=0 C=0.P DAT0=C.P
RTN

*OBJ.HEART.UP
% READ SPRITE 
A=R2.A C=R4.A
A+C.A R4=A.W

LC 07 B=C.B

A=0.A C=0.A
D0=(5)SX A=DAT0.B
LC 60 ?A>C.B
{
 D0=(5)SY C=DAT0.B
 GOSUBL DISP.A.C.R4.B
}

?ST=0.8 RTNYES

?ST=0.6
{
 %VERS LA DROITE
 GOSUBL MURD_T
 SKIPNC
 {
  ST=0.6 EXIT2
 }
 D0=(5)SX A=DAT0.B
% LC 5F ?A<C.B
% {
%  ST=0.6 EXIT2
% }
 A+1.B
 DAT0=A.B
}
SKELSE
{
 %VERS LA GAUCHE
 GOSUBL MURG_T
 SKIPNC
 {
  ST=1.6 EXIT2
 }
 D0=(5)SX A=DAT0.B
 ?A#0.B
 {
  ST=1.6 EXIT2
 }
 A-1.B
 DAT0=A.B
}

%LOOK AROUND CHAMP
D0=(5)SX A=DAT0.B
D0=(5)MX C=DAT0.B
{
 C+4.B ?C<A.B EXIT
 A+8.B ?C>A.B EXIT
 
 D0=(5)SY A=DAT0.B
 D0=(5)MCLIPH C=DAT0.B
 A+C.B
 D0=(5)MY C=DAT0.B

 C+4.B ?C<A.B EXIT
 A+8.B ?C>A.B EXIT
 
  %CHAMP UP
  D0=(5)VIE A=DAT0.B
  SETDEC A+1.B SETHEX
  DAT0=A.B
  %PLUS DE CHAMPIGNON
  ST=0.5
  %UN PANEL A AFFICHER
  D0=(5)FLAG01
  A=DAT0.4
  ABIT=1.0
  DAT0=A.4
}

GOSUBL SOL_T
SKIPC
{
 D0=(5)SY A=DAT0.B
 LC 37 ?A>=C.B ->{
  ST=0.5 %DEATH
 }
 SKELSE
 {
  A+1.B DAT0=A.B
 }
}

GOLONG FIN

*OBJ.CHAMP.UP
% READ SPRITE 
A=R2.A C=R4.A
A+4.A
A+C.A R4=A.W

LC 07 B=C.B

A=0.A C=0.A
D0=(5)SX A=DAT0.B
LC 60 ?A>C.B
{
 D0=(5)SY C=DAT0.B
 GOSUBL DISP.A.C.R4.B
}

?ST=0.8 RTNYES

?ST=0.6
{
 %VERS LA DROITE
 GOSUBL MURD_T
 SKIPNC
 {
  ST=0.6 EXIT2
 }
 D0=(5)SX A=DAT0.B
% LC 5F ?A<C.B
% {
%  ST=0.6 EXIT2
% }
 A+1.B
 DAT0=A.B
}
SKELSE
{
 %VERS LA GAUCHE
 GOSUBL MURG_T
 SKIPNC
 {
  ST=1.6 EXIT2
 }
 D0=(5)SX A=DAT0.B
 ?A#0.B
 {
  ST=1.6 EXIT2
 }
 A-1.B
 DAT0=A.B
}

%LOOK AROUND CHAMP
D0=(5)SX A=DAT0.B
D0=(5)MX C=DAT0.B
{
 C+4.B ?C<A.B EXIT
 A+8.B ?C>A.B EXIT
 
 D0=(5)SY A=DAT0.B
 D0=(5)MCLIPH C=DAT0.B
 A+C.B
 D0=(5)MY C=DAT0.B

 C+4.B ?C<A.B EXIT
 A+8.B ?C>A.B EXIT
GOTO CCC
}
SKIP {
 *CCC
  %+20 COINS
  D0=(5)COIN A=DAT0.X
 LC 90
 ?A<C.B
 {
  A=0.X DAT0=A.X
  D0=(5)VIE A=DAT0.B
  SETDEC A+1.B SETHEX
  DAT0=A.B
  %UN PANEL A AFFICHER
  D0=(5)FLAG01
  A=DAT0.4
  ABIT=1.0
  ABIT=1.1
  DAT0=A.4
 }
 SKELSE
 {
  SETDEC A+16.X SETHEX
  DAT0=A.X
  %UN PANEL A AFFICHER
  D0=(5)FLAG01
  A=DAT0.4
  ABIT=1.1
  DAT0=A.4
 }
  %PLUS DE CHAMPIGNON
  ST=0.5
}

GOSUBL SOL_T
SKIPC
{
 D0=(5)SY A=DAT0.B
 LC 37 ?A>=C.B ->{
  ST=0.5 %DEATH
 }
 SKELSE
 {
  A+1.B DAT0=A.B
 }
}

GOLONG FIN

*OBJ.STAR.UP
% READ SPRITE 
A=R2.A C=R4.A
A+8.A
A+C.A R4=A.W

LC 07 B=C.B

A=0.A C=0.A
D0=(5)SX A=DAT0.B
LC 60 ?A>C.B
{
 D0=(5)SY C=DAT0.B
 GOSUBL DISP.A.C.R4.B
}

?ST=0.8 RTNYES

?ST=0.6
{
 %VERS LA DROITE
 GOSUBL MURD_T
 SKIPNC
 {
  ST=0.6 EXIT2
 }
 D0=(5)SX A=DAT0.B
% LC 5F ?A<C.B
% {
%  ST=0.6 EXIT2
% }
 A+1.B
 DAT0=A.B
}
SKELSE
{
 %VERS LA GAUCHE
 GOSUBL MURG_T
 SKIPNC
 {
  ST=1.6 EXIT2
 }
 D0=(5)SX A=DAT0.B
 ?A#0.B
 {
  ST=1.6 EXIT2
 }
 A-1.B
 DAT0=A.B
}

%LOOK AROUND CHAMP
D0=(5)SX A=DAT0.B
D0=(5)MX C=DAT0.B
{
 C+4.B ?C<A.B EXIT
 A+8.B ?C>A.B EXIT
 
 D0=(5)SY A=DAT0.B
 D0=(5)MCLIPH C=DAT0.B
 A+C.B
 D0=(5)MY C=DAT0.B

 C+4.B ?C<A.B EXIT
 A+8.B ?C>A.B EXIT
SKIP
{ 
  %CHAMP UP
  D0=(5)VIE A=DAT0.B
  SETDEC A+1.B SETHEX
  DAT0=A.B
}
  %PLUS DE CHAMPIGNON
  ST=0.5
  %UN PANEL A AFFICHER
  D0=(5)FLAG01
  A=DAT0.4
  ABIT=1.0
  DAT0=A.4
}

GOSUBL SOL_T
SKIPC
{
 D0=(5)SY A=DAT0.B
 LC 37 ?A>=C.B ->{
  ST=0.5 %DEATH
 }
 SKELSE
 {
  A+1.B DAT0=A.B
 }
}
GOLONG FIN

*DIVISION
%A/C=D+B
D=0.A
{
 ?A>=C.A ->{ A-C.A D+1.A UP2 }
 SKELSE
 { B=A.A }
}
RTN

*FLAGS
D0=(5)FLAG01 A=DAT0.4
?ABIT=0.0
{
 ABIT=0.0 DAT0=A.4
 GOSUBL VIES
}
D0=(5)FLAG01 A=DAT0.4
?ABIT=0.1
{
 ABIT=0.1 DAT0=A.4
 GOSUBL COINS
}
RTN


ENDCODE
;
@
