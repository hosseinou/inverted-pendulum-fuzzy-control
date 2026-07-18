# Fuzzy Logic Control of an Inverted Pendulum

This repository contains the MATLAB/Simulink implementation of a Mamdani-type Fuzzy Logic Controller (FLC) designed to stabilize an inverted pendulum on a cart. This project was developed as part of the "Computer Application in Control" coursework at Shiraz University.

## 📌 Project Overview
The inverted pendulum is a classic, highly non-linear, and unstable control problem. The objective of this project is to maintain the pendulum in its upright position (unstable equilibrium) by applying a horizontal control force to the cart. 

Instead of using traditional linear control methods (like LQR or PID), this system utilizes a rule-based **Fuzzy Logic Controller** to handle the non-linear dynamics.

## ⚙️ System Architecture

### 1. Plant Dynamics (Simulink)
The non-linear differential equations governing the pendulum's motion are modeled directly inside Simulink using a custom function block. The model computes the angular acceleration based on the applied force and current state variables (gravity, pendulum mass, cart mass, and length).

### 2. Fuzzy Logic Controller (FIS)
The controller was designed using MATLAB's Fuzzy Logic Toolbox with the following specifications:
*   **Type:** Mamdani Inference System
*   **Inputs (2):** 
    *   `Theta` (Pendulum Angle) 
    *   `Thatadot` (Angular Velocity)
*   **Output (1):** 
    *   `Force` (Control action applied to the cart)
*   **Membership Functions:** 5 Triangular (`trimf`) functions per variable (NB, NS, ZO, PS, PB).
*   **Rule Base:** 25 carefully tuned fuzzy IF-THEN rules evaluate the system state and determine the appropriate restorative force.

## 📂 Repository Structure
*   `init_pendulum.m`: MATLAB script that loads the physical constants (mass, length, gravity) and initial integrator states into the workspace.
*   `inverted_pendulum.mdl`: The Simulink model containing the non-linear plant and the Fuzzy Controller block.
*   `controller.fis`: The Fuzzy Inference System file containing the membership functions and the 25-rule control logic.

## 🚀 How to Run the Simulation
1. Clone this repository to your local machine.
2. Open MATLAB and navigate to the repository directory.
3. Run the initialization script by typing `init_pendulum` in the Command Window. This will load the required parameters into the workspace.
4. Open the `inverted_pendulum.mdl` file in Simulink.
5. Ensure the Fuzzy Logic Controller block is configured to read the `controller.fis` file.
6. Run the simulation to observe the stabilization of the pendulum.
