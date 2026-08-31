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
├── Architecture.png
└── README.md

🔍 UVM Components
●Transaction

ram_trans extends uvm_sequence_item and represents the RAM transaction containing address and data information.

●Sequences

Separate sequences are implemented for read and write operations.

ram_wseqs – Generates write transactions.
ram_rseqs – Generates read transactions.

●Sequencers

Separate sequencers provide transactions from the corresponding sequences to the drivers.

wseqr – Write sequencer.
rseqr – Read sequencer.

●Drivers

The drivers convert sequence transactions into DUT-level signal activity through the virtual interface.

wdrv – Drives write enable, address, and write data.
rdrv – Drives read enable and read address.

●Monitors

The monitors observe DUT activity and collect transactions through the interface.

wmon – Monitors write transactions.
rmon – Monitors read transactions and captures read data.

●Agents

Two independent UVM agents are used:

wagent – Write agent.
ragent – Read agent.

Each active agent contains its corresponding sequencer, driver, and monitor.

●Configuration

my_config stores the virtual interface and active/passive configuration used by the UVM components.

●Scoreboard

The scoreboard maintains a reference memory model to store expected RAM contents.

For a write transaction:

Expected Memory[write_addr] = write_data

For a read transaction, the scoreboard compares:

Expected Data ↔ Actual Read Data

A successful comparison generates:

[SB] DATA MATCHED SUCCESSFULLY

●Environment

ram_env instantiates and connects the read agent, write agent, and scoreboard.

●Test

ram_test creates the configuration, environment, and read/write sequences and starts the sequences on their respective sequencers.

🧪 Test Scenario

The current test performs a basic write-read verification.

Write Operation
Write Address = 5
Write Data    = 100
Read Operation
Read Address = 5

The scoreboard verifies that the data read from address 5 matches the previously written value.

✅ Simulation Result
![Simulation Result](<img width="1440" height="900" alt="Result" src="https://github.com/user-attachments/assets/5359ed20-491f-4c29-af3f-5b7affba9221" />
)

The design was simulated using Synopsys VCS with UVM.

The scoreboard successfully reported:

[SB] DATA MATCHED SUCCESSFULLY
UVM Report Summary
UVM_INFO    : 4
UVM_WARNING : 0
UVM_ERROR   : 0
UVM_FATAL   : 0

The simulation completed successfully at 15 ns.

🛠️ Tools & Technologies
SystemVerilog
UVM
Synopsys VCS
EDA Playground
Git
GitHub

📚 UVM Concepts Demonstrated
uvm_test
uvm_env
uvm_agent
uvm_driver
uvm_monitor
uvm_sequencer
uvm_sequence
uvm_sequence_item
uvm_scoreboard
uvm_analysis_port
uvm_tlm_analysis_fifo
uvm_config_db
Virtual interfaces
Clocking blocks
Modports
UVM factory
UVM phases
Objection mechanism
TLM communication

📈 Verification Flow
The UVM test creates the verification environment.
Read and write sequences generate transactions.
Sequencers provide transactions to their respective drivers.
Drivers drive the transactions to the DUT through the virtual interface.
Monitors observe the DUT activity.
Write transactions update the reference memory in the scoreboard.
Read transactions are compared against the expected memory contents.
The scoreboard reports PASS/FAIL results.

🎓 Key Learning

This project demonstrates the development of a class-based UVM verification environment for a dual-port RAM, including independent read/write stimulus generation, transaction-level communication, virtual interface usage, monitoring, reference modeling, and automated scoreboard-based checking.
