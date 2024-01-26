.title ripplecarryadder
.protect
.lib '/cad/cell_lib/cic018.l'tt
.unprotect
.option post captab accurate
.temp 25
.meas tran pwr avg power

.global vdd vss
vdd vdd 0 dc 1.3
vss vss 0 dc 0

.subckt xor vin1 vin2 vout vdd vss
mp0 inv1 vin1 vdd vdd P_18 W=1.13u l=0.19u
mp1 c inv1 vdd vdd P_18 W=1.13u l=0.19u
mp2 vout vin2 c vdd P_18 W=1.13u l=0.19u
mp3 vout vin1 d vdd P_18 W=1.13u l=0.19u
mp4 d inv2 vdd vdd P_18 W=1.13u l=0.19u
mp5 inv2 vin2 vdd vdd P_18 W=1.13u l=0.19u

mn0 inv1 vin1 vss vss N_18 W=0.58u l=0.19u
mn1 e vin2 vss vss N_18 W=0.58u l=0.19u
mn2 vout vin1 e vss N_18 W=0.58u l=0.19u
mn3 vout inv1 f vss N_18 W=0.58u l=0.19u
mn4 f inv2 vss vss N_18 W=0.58u l=0.19u
mn5 inv2 vin2 vss vss N_18 W=0.58u l=0.19u
.ends

.subckt and vin1 vin2 vout vdd vss
mp0 v1 vin1 vdd vdd P_18 W=1.13u l=0.19u
mp1 v1 vin2 vdd vdd P_18 W=1.13u l=0.19u
mp2 vout v1 vdd vdd P_18 W=1.13u l=0.19u

mn0 c vin1 vss vss N_18 W=0.58u l=0.19u
mn1 v1 vin2 c vss N_18 W=0.58u l=0.19u
mn2 vout v1 vss vss N_18 W=0.58u l=0.19u
.ends

.subckt or vin1 vin2 vout vdd vss
mp0 c vin1 vdd vdd P_18 W=1.13u l=0.19u
mp1 v1 vin2 c vdd P_18 W=1.13u l=0.19u
mp2 vout v1 vdd vdd P_18 W=1.13u l=0.19u

mn0 v1 vin1 vss vss N_18 W=0.58u l=0.19u
mn1 v1 vin2 vss vss N_18 W=0.58u l=0.19u
mn2 vout v1 vss vss N_18 W=0.58u l=0.19u
.ends

.subckt FA A B cin cout sout vdd vss
Xxor1 A B out1 vdd vss xor
Xxor3 out1 cin sout vdd vss xor
Xand2 A B out2 vdd vss and
Xand4 out1 cin out3 vdd vss and
Xor5 out2 out3 cout vdd vss or
.ends

.subckt threeBFA c0 x0 y0 x1 y1 x2 y2 s0 s1 s2 cout vdd vss
XFA1 x0 y0 c0 cout1 s0 vdd vss FA
XFA2 x1 y1 cout1 cout2 s1 vdd vss FA
XFA3 x2 y2 cout2 cout s2 vdd vss FA
.ends

Vx0 x0 0 pulse (0v 1.3v 4.9ns 0.1ns 0.1ns 4.9ns 10ns)
Vx1 x1 0 pulse (0v 1.3v 9.9ns 0.1ns 0.1ns 9.9ns 20ns)
Vx2 x2 0 pulse (0v 1.3v 19.9ns 0.1ns 0.1ns 19.9ns 40ns)
Vy0 y0 0 pulse (0v 1.3v 9.9ns 0.1ns 0.1ns 9.9ns 20ns)
Vy1 y1 0 pulse (0v 1.3v 4.9ns 0.1ns 0.1ns 4.9ns 10ns)
Vy2 y2 0 pulse (0v 1.3v 19.9ns 0.1ns 0.1ns 19.9ns 40ns)
Vc0 c0 0 pulse (0v 1.3v 9.9ns 0.1ns 0.1ns 9.9ns 20ns)

XFA1 x0 y0 c0 cout1 s0 vdd vss FA
XFA2 x1 y1 cout1 cout2 s1 vdd vss FA
XFA3 x2 y2 cout2 cout s2 vdd vss FA

Cload1 cout1 vss 1f
Cload2 cout2 vss 1f
Cload3 cout vss 1f
Cload4 s0 vss 1f
Cload5 s1 vss 1f
Cload6 s2 vss 1f

.tran 0.01n 50n
.option post
.end