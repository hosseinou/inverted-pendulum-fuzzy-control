# Inverted Pendulum Fuzzy Logic Control

This repository contains a MATLAB and Simulink implementation of an inverted pendulum stabilization system controlled by fuzzy logic. 

## Project Overview
The system models the physical dynamics of an inverted pendulum mounted on a cart and uses a rule-based fuzzy controller to maintain its upright position. 

### 1. Plant Dynamics & Physical Model
The physical environment and non-linear dynamics of the pendulum are defined using a MATLAB initialization script and simulated in Simulink. 
*   **System Parameters:** The model operates with an acceleration due to gravity of 9.81 m/s², a pendulum mass of 0.1 kg, a cart mass of 1.0 kg, and a pendulum length of 0.5 m.
*   **Simulink Plant:** These parameters are evaluated inside a mathematical function block (`Fcn`) within the Simulink model to calculate the continuous motion and behavior of the system.
*   **Simulation Test:** To physically prove the controller's stabilizing capabilities, the integrators are initialized with the pendulum leaning slightly off-balance at an initial angle (`x1_0`) of 0.1 radians, with an initial angular velocity (`x2_0`) of 0.0 rad/s.

### 2. Fuzzy Logic Controller
The control strategy relies on a Mamdani-type Fuzzy Inference System rather than standard linear control methodologies. 
*   **Inputs:** The controller evaluates the pendulum's current angle (`Theta`, with a range of -1.6 to 1.6) and its angular velocity (`Thatadot`, with a range of -5 to 5). 
*   **Output:** It computes the necessary horizontal corrective `Force` (ranging from -40 to 40) to apply to the system.
*   **Logic Structure:** The controller utilizes 5 triangular membership functions (`trimf`) for each variable: NB, NS, ZO, PS, and PB.
*   **Rule Base:** The core control behavior is driven by a matrix of exactly 25 IF-THEN rules to determine the appropriate stabilization force under varying conditions.

## Repository Files
*   `init_pendulum.m`: A MATLAB script that loads the physical constants (mass, length, gravity) and the initial off-balance starting conditions into the system workspace.
*   `controller_2.fis`: The Fuzzy Inference System file containing the variable ranges, the triangular membership functions, and the 25-rule control logic.
*   `inverted_pendulum_2.mdl`: The primary Simulink model file that contains the non-linear plant equations, integrators, and the Fuzzy Logic Controller.
