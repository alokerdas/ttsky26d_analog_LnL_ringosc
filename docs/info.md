<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This is a programmable ring oscillator. There are 4 bits to program. If the values of them is 1111 then the oscillator outputs the slowest frequency. If the values are 0000 it outputs the highest frequency. The highest frequency is 1 GHz, and the lowest frequency is 50 MHz approximately. There is no circuit to compensate the change in the frequency for the change in temperature.  

There is a 4-bit register inside the oscillator. The register is D-latch based. The bits connected as follows:
Bit 0 -> ui_in[0]
Bit 1 -> ui_in[1]
Bit 2 -> ui_in[2]
Bit 3 -> ui_in[3]
The rst pin is connected to enable pins of the latches. If high, then the bit values can be changed. If low the bit values wont change.
The latches can be bypassed if there are any issues with the latches. The outputs of the latches are connected as follows:
Output of Bit 0 latch -> ui_in[4]
Output of Bit 1 latch -> ui_in[5]
Output of Bit 2 latch -> ui_in[6]
Output of Bit 3 latch -> ui_in[7]
Analog feruency out -> ua[0]
If latches are bypassed, the rst pin must be 0 and the pins ui_in[4:7] must be driven continously.

----------------------------------------------------------
An 8:1 MUX selects one of eight data inputs (I0–I7) using three select lines (S2, S1, S0), so that Y = I[S2 S1 S0]. We chose a tree (hierarchical) structure of 2:1 multiplexers instead of a flat 8:1 design because. The basic cell uses pass-transistor (transmission-gate style) logic. Each data input (A and B) is
connected to the output Y through a complementary NMOS/PMOS pass pair, and the pass pairs are controlled by the select signal S and its complement. A minimum-size inverter (M5 – NMOS,M6 – PMOS) generates the complement of S inside the cell. The cell therefore has the ports A, B, S, Y, VDD and VSS, and uses 6 transistors in total.
I0 -> ui_in[0]
I1 -> ui_in[1]
I2 -> ui_in[2]
I3 -> ui_in[3]
I4 -> ui_in[4]
I5 -> ui_in[5]
I6 -> ui_in[6]
I7 -> ui_in[7]

out -> uo_out[4]

----------------------------------------------------------
Designed a 6T SRAM bit cell and a complete 16-bit SRAM (4 words × 4 bits) with all its peripheral circuits, and took both through the full custom flow in SKY130. The final layout is DRC clean in both Magic and the KLayout sign-off deck, passes LVS, and reads back every stored word correctly in post-layout simulation.

Key results
ResultValue
Complete SRAM16 bits, 204 transistors, 26.2 × 44.66 μm (1,170 μm2)
Bit cell area17.6 μm2 (compact layout), 11.0× smaller than our first layout (194.4
μm2)
Cell stabilityHold SNM 707.3 mV, read SNM 416.5 mV
Functional test4 of 4 reads correct in schematic and post-layout (1010, 0101, 1100,
0101), no disturb
Decoder delay (WLEN → WL)93.9 ps schematic, 163.6 ps post-layout
Read time (WLEN → valid DOUT)0.52 ns schematic, 0.54 ns post-layout
Average power (7 cycles, 10 ns each)25.9 μW schematic, 40.6 μW post-layout

addr0 -> ui_in[0]
addr1 -> ui_in[1]
WE -> ui_in[2]
PRE_b -> ui_in[3]
din0 -> ui_in[4]
din1 -> ui_in[5]
din2 -> ui_in[6]
din3 -> ui_in[7]
addr0 -> ui_in

sae -> uio_in[0]
wlen -> uio_in[1]

dout0 -> uo_out[0]
dout1 -> uo_out[1]
dout2 -> uo_out[2]
dout3 -> uo_out[3]

----------------------------------------------------------
This describes the schematic design, layout and post-layout verification of an 8-bit binary-weighted capacitive digital-to-analog converter (CDAC) driving a clocked CMOS comparator.
The array uses nine metal-insulator-metal (MIM) capacitors with a total capacitance of about 2.63 pF. The layout is free of DRC violations, and Netgen reports a unique LVS match of 16 devices, 17 nets and 14 pins. Pre-layout and extracted post-layout transient simulations both show the expected descending staircase at the DAC output, from about 1.79 V to 0 V over 256 codes, and the comparator output stops toggling once the DAC voltage falls below its trip point. A hand analysis of the capacitor sizes shows that scaling each square capacitor by √2 per bit leaves the array short of exact binary ratios, and the simulated 256-code sweep confirms it: DNL ranges from −2.00 to +0.12 LSB with three non-monotonic steps (codes 64, 128 and 192), INL ranges from −1.13 to +1.17 LSB, and the gain error is −0.21 %. The comparator, a single-stage differential amplifier without a regenerative latch, does not settle to clean logic levels within each clock phase. Both findings are reported with the changes needed to fix them.

dac0 -> uio_in[0]
dac1 -> uio_in[1]
dac2 -> uio_in[2]
dac3 -> uio_in[3]
dac4 -> uio_in[4]
dac5 -> uio_in[5]
dac6 -> uio_in[6]
dac7 -> uio_in[7]
analog_out -> ua[4]

----------------------------------------------------------
The design is a voltage-controlled oscillator (VCO) whose output is divided down by 128 and by 256. The VCO is a five-stage current-starved ring oscillator; the control voltage Vctrl sets how much current each stage may draw and therefore how fast the ring runs. At Vctrl = 1.8 V the ring runs at 1.8 GHz in the schematic and about 0.96 GHz after layout, which is too fast to bring off-chip or to observe easily, so it drives a chain of eight toggle flip-flops (an asynchronous ripple counter). Two outputs are taken from the chain: out_div128 (flip-flop 7, Q6) and out_div256 (flip-flop 8, Q7), each through a standard-cell output buffer.
VCO output/128 -> uo_out[5]
VCO output/256 -> uo_out[6]
V control analog input -> ua[2]

----------------------------------------------------------
The circuit designed in this project is a 9-stage CMOS ring oscillator that generates a continuous periodic output without requiring an external clock. It consists of nine CMOS inverters connected in a closed loop, with the output of the last inverter fed back to the input of the first.
Ring oscillator output -> ua[3]

----------------------------------------------------------
This project implements a voltage-controlled oscillator (VCO) whose output frequency is set by an analog control voltage, Vctrl. Limiting the charge and discharge current of each inverter with a controlled current source gives a direct, monotonic relationship between Vctrl and oscillation frequency. An extra inverter at the output restores a clean rail-to-rail swing and isolates the ring from the load.
VCO output -> ua[1]
V control analog input -> ua[2]

## How to test

A detailed document of the pin assignment shall be created after receiving the chips. There are 6 designs in this. So carefull effort is needed to test it.

## External hardware

One oscilloscope is needed to measure the frequency. 
