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

.subckt 3BFA c0 x0 y0 x1 y1 x2 y2 s0 s1 s2 cout vdd vss
XFA1 x0 y0 c0 cout1 s0 vdd vss FA
XFA2 x1 y1 cout1 cout2 s1 vdd vss FA
XFA3 x2 y2 cout2 cout s2 vdd vss FA
.ends