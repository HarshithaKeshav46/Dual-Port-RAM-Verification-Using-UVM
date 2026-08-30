# Dual-Port RAM Verification Using UVM

## 📌 Overview

This project implements and verifies a **Dual-Port RAM** using **SystemVerilog and UVM**.

A complete UVM-based verification environment is developed with separate read and write agents to generate, drive, monitor, and verify RAM transactions.

The verification environment uses a **scoreboard-based checking mechanism** to compare the actual read data from the DUT with the expected data stored in a reference memory model.

## 🎯 Objectives

- Verify read and write operations of a dual-port RAM.
- Develop separate UVM agents for read and write ports.
- Generate read and write transactions using UVM sequences.
- Drive DUT signals using UVM drivers and virtual interfaces.
- Monitor DUT activity using UVM monitors.
- Maintain expected RAM contents using a reference memory model.
- Compare expected and actual read data using a scoreboard.
- Demonstrate a structured UVM verification environment.

## 🧩 Design Under Test

The Design Under Test (DUT) is a **Dual-Port RAM** with independent read and write ports.

### Main Signals

| Signal | Description |
|---|---|
| `clock` | Common clock |
| `write_en` | Write enable |
| `write_addr` | Write address |
| `write_data` | Data written to RAM |
| `read_en` | Read enable |
| `read_addr` | Read address |
| `read_data` | Data read from RAM |

## 🏗️ Verification Architecture

The verification environment consists of:

- Write Agent
- Read Agent
- Write Sequencer
- Read Sequencer
- Write Driver
- Read Driver
- Write Monitor
- Read Monitor
- Scoreboard
- Configuration Object
- UVM Environment
- UVM Test

The architecture diagram is provided below.

![UVM Architecture](architecture.png)

## 📂 Project Structure

```text
dual-port-ram-uvm/
│
├── DUT/
│   ├── design.sv
│   └── ram_if.sv
│
├── UVM/
│   ├── ram_trans.sv
│   ├── ram_config.sv
│   ├── ram_wseqs.sv
│   ├── ram_rseqs.sv
│   ├── ram_wseqr.sv
│   ├── ram_rseqr.sv
│   ├── ram_wdrv.sv
│   ├── ram_rdrv.sv
│   ├── ram_wmon.sv
│   ├── ram_rmon.sv
│   ├── ram_wagent.sv
│   ├── ram_ragent.sv
│   ├── ram_sb.sv
│   ├── ram_env.sv
│   └── ram_test.sv
│
├── testbench.sv
├── architecture.png
└── README.md
