Digital Logic Design (DLD) Project: Synchronous Vending Machine
Overview
This repository contains the design and implementation of a fully functional, coin-operated Vending Machine, developed for a Digital Logic Design (DLD) course. The system is modeled using Verilog HDL and demonstrates the practical application of a Finite State Machine (FSM) to create a robust, synchronous digital system.

The project successfully simulates the entire transaction process, from item selection and payment to change dispensing.

Key Features & Specifications
The machine's control logic is built around a five-state synchronous FSM to manage the sequential flow of operations:

State 0 - Idle: The default state, waiting for the user to select an item.

State 1 - Item Selection: The machine displays the price of the selected item.

State 2 - Payment Processing: Accepts coins and checks if the balance is sufficient.

State 3 - Dispense Item: Activates the solenoid for the selected item and calculates any remaining balance.

State 4 - Dispense Change: Returns overpaid funds to the user.

Technical Details
Implementation Language: Verilog HDL.

Accepted Coins: Accepts coins with values of 1, 2, 5, and 10 units.

Change Dispensing: Logic in State 4 dispenses change in a descending coin order (10→5→2→1 units).

Display: Uses an 8-bit output to show the current balance or status messages (e.g., insufficient funds, out-of-stock).

Design Type: Synchronous, sequential FSM.

Project Implementation & Verification
This project was a comprehensive exercise focusing on both code design and hardware realization:

Verilog Simulation: The primary code was tested and verified using ModelSim Altera Edition. A test bench (used for verification but not included here) simulated various scenarios, including coin addition, insufficient funds, and change dispensing.

Physical Design Foundation: The logic structure was prepared for potential physical implementation using an FPGA platform. Key principles were also translated to demonstrate feasibility with 74-series TTL/CMOS ICs, providing hands-on experience with physical circuit logic.

Repository Files
vending_machine.v: The core Verilog HDL module containing the FSM, balance logic, and I/O controls.

DLD Project Report 1.docx: The complete project report, which details the objective, FSM design, code walkthrough, and simulation/testing approach.

.gitignore: Excludes simulator-specific output files to keep the repository clean.

How to Run the Project (Using ModelSim)
Clone the Repository:

git clone [Your Repository URL]

Open in ModelSim:

Launch ModelSim Altera Edition.

Create a new project and add vending_machine.v as an existing file.

Simulate: Compile the file and run the simulation using a test bench to observe the FSM state changes, balance updates, and outputs.

Connect with Me
Feel free to connect with me on LinkedIn to discuss digital systems, Verilog, or other projects!
