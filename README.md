# MAC-Muliplier-Accumulator-Design-Using-different-Compressors
This project implements a Low Power Multiply-Accumulate (MAC) architecture using 4:2 and 5:2 compressor logic to achieve reduced area, delay, and power consumption. The design is modeled in Verilog HDL and synthesized using Xilinx Vivado on an Artix-7 FPGA platform.

***Project Objective***

To design a low-power and high-performance MAC unit suitable for DSP applications.

To reduce dynamic switching power and critical path delay using optimized compressor circuits.

To compare multiple compressor architectures to find the most power-efficient design.

To validate the architecture through simulation, synthesis, and performance evaluation.

***Methodology***

Generation of partial products using Modified Booth algorithm

Reduction using 4:2 and 5:2 compressors

Carry-propagate addition to form the result

Accumulation through feedback register

Simulation & synthesis using Vivado 2021.1

FPGA deployment on Artix-7
