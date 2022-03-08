# 8-Bit Processor
 Implementation of a simple 8-bit processor in Verilog

## Single Cycle
This processor supports data transfer `mov`, constant addition `addi` and unconditional jump `J` instructions only. The processor has Reset and CLK as inputs and no outputs. The processor has instruction fetch unit, register file (with eight 8-bit registers), execution and writeback unit. Read operation on the register file is independent of CLK whereas the write happens on the positive edge of the CLK. When reset is activated the PC register is initialized to 0, the instruction memory and register file get loaded by predefined values. PC, address and data are all 8-bit values.

### Block Diagram
![](https://github.com/vicky089f/8_bit_Processor/blob/main/Images/Single%20Cycle.jpg)

## Pipelined
The pipelined version also supports the same instructions. In addition it implements forwarding to resolve data hazards. It contains three pipelined registers, `IF/ID`, `ID/EX` and `EX/WB`. When reset is activated the PC, IF/ID, ID/EX, EX/WB registers are initialized to 0, the instruction memory and register file get loaded by predefined values. When the instruction unit starts fetching the first instruction the pipeline registers contain unknown values. When the second instruction is being fetched in IF unit, the IF/ID register will hold the instruction code for first instruction. When the third instruction is being fetched by IF unit, the IF/ID register contains the instruction code of second instruction, ID/EX register contains information related to first instruction and so on.
### Block Diagram
![](https://github.com/vicky089f/8_bit_Processor/blob/main/Images/Pipeline.jpg)

## Instruction Set

### MOV Instruction
![](https://github.com/vicky089f/8_bit_Processor/blob/main/Images/mov.png)
![](https://github.com/vicky089f/8_bit_Processor/blob/main/Images/mov_text.png)

### ADDI Instruction
![](https://github.com/vicky089f/8_bit_Processor/blob/main/Images/addi.png)
![](https://github.com/vicky089f/8_bit_Processor/blob/main/Images/addi_text.png)

### J Instruction
![](https://github.com/vicky089f/8_bit_Processor/blob/main/Images/jump.png)
![](https://github.com/vicky089f/8_bit_Processor/blob/main/Images/jump_text.png)

