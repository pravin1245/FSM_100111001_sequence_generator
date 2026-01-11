# FSM_100111001_sequence_generator

FSM-based sequence generator implemented in Verilog HDL to generate a fixed 9-bit binary sequence (100111001) using a Moore Finite State Machine. The design includes serial output generation, internal SIPO logic for parallel output, and state visibility for debugging and verification.

# FSM 100111001 Sequence Generator

## Overview
This project demonstrates a Moore FSM-based digital sequence generator that produces a predefined 9-bit binary sequence (100111001).  
Each FSM state represents one bit of the sequence, and the FSM advances on every positive clock edge. After completing the sequence, the FSM automatically loops back to the initial state for continuous operation.

The serial output is internally captured using a SIPO (Serial-In Parallel-Out) shift register, allowing the complete sequence to be observed in parallel. A sequence completion flag (seq_done) and state output (state_out) are provided for verification and debugging.

## Features
- Moore Finite State Machine implementation
- Generates fixed binary sequence 100111001
- 9 parameterized FSM states (A to I)
- Serial output generation
- Internal SIPO shift register for 9-bit parallel output
- Sequence completion indication using seq_done
- FSM state visibility through state_out
- Active-low asynchronous reset
- Fully synthesizable Verilog HDL design
- Verified using testbench simulation and waveform analysis

## FSM State Table

| Current State | State Code | Output Bit | Next State |
|--------------|------------|------------|------------|
| A | 0000 | 1 | B |
| B | 0001 | 0 | C |
| C | 0010 | 0 | D |
| D | 0011 | 1 | E |
| E | 0100 | 1 | F |
| F | 0101 | 1 | G |
| G | 0110 | 0 | H |
| H | 0111 | 0 | I |
| I | 1000 | 1 | A |

Generated Sequence: **100111001**

## FSM Operation
- FSM advances on every positive clock edge
- Output depends only on the current state (Moore behavior)
- After state I, FSM transitions back to state A
- Sequence repeats continuously

## Module Interface

### Inputs
- clk  : System clock
- rst  : Active-low asynchronous reset

### Outputs
- serial_out    : Serial output bit
- seq_out[8:0]  : Parallel sequence output (SIPO)
- seq_done      : High when one full sequence is completed
- state_out[3:0]: Current FSM state

## Modules
- FSM_100111001_seq_generator.v – FSM-based sequence generator
- FSM_100111001_tb.v            – Testbench for functional verification

## Verification
- Testbench written in Verilog HDL
- Simulation confirms:
  - Correct state transitions
  - Correct serial output sequence
  - Proper parallel output via SIPO
  - Accurate seq_done assertion
  - Proper reset behavior

## Applications
- Digital sequence generators
- FSM-based control systems
- RTL design practice
- FPGA learning and academic projects


