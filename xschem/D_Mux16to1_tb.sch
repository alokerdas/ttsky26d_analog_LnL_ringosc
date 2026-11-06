v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
P 4 1 160 -460 {}
P 4 1 350 -460 {}
P 4 1 250 -460 {}
N 120 -140 200 -140 {lab=data3}
N 30 -170 200 -170 {lab=data2}
N -20 -210 200 -210 {lab=data1}
N -50 -210 -20 -210 {lab=data1}
N -100 -250 200 -250 {lab=data0}
C {D_Mux16to1.sym} 170 -30 0 0 {name=x1}
C {vsource.sym} -100 -220 0 0 {name="V0" value="0" savecurrent=false
}
C {vsource.sym} -50 -180 0 0 {name="V1" value="0" savecurrent=false}
C {vsource.sym} 30 -140 0 0 {name="V2" value="0" savecurrent=false}
C {vsource.sym} 120 -110 0 0 {name="V3" value="0" savecurrent=false}
C {vsource.sym} 570 -230 0 0 {name=V5 value="1.8" savecurrent=false}
C {vsource.sym} 200 -80 0 0 {name="V4" value="1.8" savecurrent=false}
C {vdd.sym} 570 -260 0 0 {name=l1 lab=VDD}
C {gnd.sym} 570 -200 0 0 {name=l2 lab=0}
C {gnd.sym} 200 -50 0 0 {name=l3 lab=0}
C {gnd.sym} 120 -80 0 0 {name=l4 lab=0}
C {gnd.sym} 30 -110 0 0 {name=l5 lab=0}
C {gnd.sym} -50 -150 0 0 {name=l6 lab=0}
C {gnd.sym} -100 -190 0 0 {name=l7 lab=0}
C {lab_pin.sym} -100 -250 0 0 {name=p1 sig_type=std_logic lab=data0}
C {lab_pin.sym} -50 -210 1 0 {name=p2 sig_type=std_logic lab=data1}
C {lab_pin.sym} 30 -170 1 0 {name=p3 sig_type=std_logic lab=data2}
C {lab_pin.sym} 120 -140 1 0 {name=p4 sig_type=std_logic lab=data3}
C {lab_pin.sym} 200 -110 0 0 {name=p5 sig_type=std_logic lab=enable
}
C {lab_pin.sym} 400 -180 2 0 {name=p6 sig_type=std_logic lab=fout}
C {code_shown.sym} -130 -510 0 0 {name=s1 only_toplevel=false value=".include /home/aloke/projects/install/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
.lib /home/aloke/projects/install/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.tran 1ps 25ns uic
.ic v(fout)=0
.meas tran t1 WHEN v(fout)=0.9 RISE=5
.meas tran t2 WHEN v(fout)=0.9 RISE=6
.meas tran period param='t2-t1'
.meas tran freq param='1/period'
.saveall
.end
"}
