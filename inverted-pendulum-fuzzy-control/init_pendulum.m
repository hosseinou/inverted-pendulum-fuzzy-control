clc;
clear;

g = 9.81;    % Acceleration due to gravity (m/s^2)
m = 0.1;     % Mass of the pendulum (kg)
mc = 1.0;    % Mass of the cart (kg)
l = 0.5;     % Length to pendulum center of mass (m)

% --- Initial Conditions for Integrators ---
% To prove the fuzzy controller works, we start the pendulum 
% slightly off-balance (0.1 radians) rather than perfectly upright.
x1_0 = 0.1;  % Initial angle (Theta) in radians
x2_0 = 0.0;  % Initial angular velocity (Theta_dot) in rad/s

disp('System parameters loaded successfully.');
disp('You can now run the Simulink model.');