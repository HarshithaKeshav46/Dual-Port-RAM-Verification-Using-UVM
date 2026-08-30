# Dual-Port-RAM-Verification-Using-UVM

Dual-Port RAM Verification Using UVM
📌 Project Overview

This project implements and verifies a Dual-Port RAM using SystemVerilog and UVM.

A complete UVM-based verification environment is developed with independent read and write agents, sequences, sequencers, drivers, monitors, and a scoreboard to verify RAM read/write functionality.

🎯 Objectives
Verify read and write operations of a dual-port RAM.
Develop separate UVM agents for read and write ports.
Generate read and write transactions using UVM sequences.
Drive DUT signals using UVM drivers and virtual interfaces.
Monitor DUT activity using UVM monitors.
Maintain expected memory contents in the scoreboard.
Compare expected and actual read data.
Demonstrate a structured UVM verification environment.
🧩 DUT – Dual-Port RAM

The Design Under Test is a dual-port RAM with independent read and write interfaces.

Main Signals
Signal	Description
clock	Common clock
write_en	Write enable
write_addr	Write address
write_data	Data written to RAM
read_en	Read enable
read_addr	Read address
read_data	Data read from RAM
🏗️ UVM Architecture
                         ram_test
                            |
                         ram_env
                      _____|_____
                     |           |
                write_agent   read_agent
                     |           |
              _______|_______  __|________
             |       |       | |    |     |
           wseqr    wdrv    wmon rseqr rdrv rmon
             |       |       |   |    |    |
             |       |       |   |    |    |
             |       └───────┴───┴────┘    |
             |                 |            |
             |             Dual-Port RAM    |
             |                 |            |
             └─────────────────┴────────────┘
                               |
                          Scoreboard
📂 Project Structure
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
└── README.md
🔍 UVM Components
Transaction – ram_trans.sv

Defines the RAM transaction object containing:

Write address
Read address
Write data
Read data
Read/write control information
Sequences

ram_wseqs generates write transactions and ram_rseqs generates read transactions.

Sequencers

Separate sequencers are used for the read and write agents to provide transactions to their respective drivers.

Drivers
Write Driver – drives write enable, address, and data.
Read Driver – drives read enable and read address.

Virtual interfaces and clocking blocks are used for communication with the DUT.

Monitors
Write Monitor – observes write transactions.
Read Monitor – observes read address and returned read data.

Captured transactions are sent to the scoreboard using UVM analysis ports.

Agents

Two independent agents are implemented:

Write Agent
Read Agent

Each active agent contains a sequencer, driver, and monitor.

Scoreboard

The scoreboard maintains an internal reference memory.

For every write transaction:

Expected Memory[Address] = Write Data

For every read transaction, the scoreboard compares:

Expected Data ↔ Actual Read Data

A successful comparison generates:

[SB] DATA MATCHED SUCCESSFULLY
🧪 Test Scenario

The current test performs a basic write-read verification.

Write
Write Address = 5
Write Data    = 100
Read
Read Address = 5

The scoreboard verifies that the data returned from address 5 matches the previously written value.

✅ Simulation Result

The test was simulated using Synopsys VCS with UVM.

Successful scoreboard result:

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
Git & GitHub
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
🎓 Key Learning

This project demonstrates the development of a complete UVM verification environment from the ground up for a dual-port RAM, including independent read/write stimulus generation, protocol monitoring, transaction-level communication, and automated functional checking using a scoreboard.
