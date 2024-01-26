.title ripplecarryadder
.protect
.lib '/cad/cell_lib/cic018.l'tt
.inc HW4_cpy.pex.netlist
.unprotect
.option post captab accurate
.temp 25
.meas tran pwr avg power

.global vdd vss
vdd vdd 0 dc 1.3
vss vss 0 dc 0

.meas tran Tdealy
+trig v(y0) val=1.3*0.5 rise=1
+targ v(cout) val=1.3*0.5 rise=1

Vx0 x0 0 pulse (0v 1.3v 9.9ns 0.1ns 0.1ns 9.9ns 20ns)
Vx1 x1 0 pulse (0v 1.3v 4.9ns 0.1ns 0.1ns 4.9ns 10ns)
Vx2 x2 0 pulse (0v 1.3v 4.9ns 0.1ns 0.1ns 4.9ns 10ns)
Vy0 y0 0 pulse (0v 1.3v 4.9ns 0.1ns 0.1ns 4.9ns 10ns)
Vy1 y1 0 pulse (0v 1.3v 4.9ns 0.1ns 0.1ns 4.9ns 20ns)
Vy2 y2 0 pulse (0v 1.3v 4.9ns 0.1ns 0.1ns 4.9ns 10ns)
Vc0 c0 0 pulse (0v 1.3v 4.9ns 0.1ns 0.1ns 4.9ns 10ns)

XHW4_CPY vdd x2 x1 x0 s2 s1 s0 vss y2 y1 y0 c0 cout HW4_CPY

.tran 0.01n 50n
.option post
.end