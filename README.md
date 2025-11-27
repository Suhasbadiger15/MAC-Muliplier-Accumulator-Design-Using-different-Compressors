# MAC-Multiplier-Accumulator-Design-Using-Different-Compressors

This project implements a low-power Multiply–Accumulate (MAC) architecture using 4:2 and 5:2 compressor logic.  
The design is built using Verilog HDL and synthesized on a Xilinx Artix-7 FPGA to evaluate area, delay, and power performance

### Project Objective

- Design a low-power, high-performance MAC unit for DSP applications  
- Reduce dynamic switching power using optimized compressor circuits  
- Minimize critical-path delay through efficient partial product reduction  
- Compare multiple compressor architectures for performance gains  
- Validate the MAC architecture through simulation, synthesis, and analysis  

### Methodology

- Generate partial products using Modified Booth algorithm  
- Reduce partial products using 4:2 and 5:2 compressor structures  
- Use carry-propagate adders to produce the final MAC output  
- Implement accumulation using a feedback register  
- Simulate and synthesize the design using Vivado 2021.1  
- Deploy and verify performance on Artix-7 FPGA  

### Applications

- FIR / IIR digital filters  
- Convolution engines  
- CNN accelerator datapaths  
- Edge-AI and real-time signal processing  
- Low-power DSP systems  
