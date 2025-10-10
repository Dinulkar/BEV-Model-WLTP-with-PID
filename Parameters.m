% ==================== ==================== ====================
% Author: Dinesh Kumar Rajakumaran  
% Date: October 10, 2025  
% Description: This project models a Battery Electric Vehicle (BEV) in 
% Simulink, focusing on the powertrain dynamics and implementing a PID 
% controller to follow the WLTP driving cycle.  
% ==================== ==================== ====================

clc;

% Reading the WLTP Data
WLTP = readtable("WLTP.xlsx");
t = WLTP.Var1; % represents time
a = WLTP.Var2; % represents acceleration
WLTP_sim = [t a];% Storing the Var1 and Var2

% Parameters
T1 = 390;% kg
W1 = 300;% rad/s
T2 = 195;% kg
W2 = 500;% rad/s
T3 = 100;% kg
W3 = 1000;% rad/s
T = [T1 T1 T2 T3 0]';
W = [0 W1 W2 W3 W3+5]';

% Vehicle and Driveline Parameters
Vm = 1650; % Vehicle mass in kg
rdyn = 0.27; % Dynamic wheel radius in m
i_total = 10.1; % Total gear ratio     
km = 10000;%  Motor stiffness kNm/rad
dm = 7; % Motor damping Nms/rad  
kr = 191.5;% kNm/rad
dr = 196;% Nms/rad
Imot = 1;% kgm^2
Itrans = 1.2; % kgm^2
fr = 0.017; % Rolling resistance coefficient
cw = 0.39; %Drag coefficient
A = 2.4; % Frontal Surface Area of BEV in m^2
rho = 1.2;% Air density kg/m^3
g = 9.81;% gravitational force in m/m^2

% Calculating Reduced Inertia and Resistances
% Reduced Inertia
Ir = Vm * rdyn^2 / i_total^2;   

% Rolling Resistance
Roll_F = fr * Vm * g;  % excluding velocity

% Air Resistance
Aero_F = 0.5 * cw * A * rho * rdyn^2; 

% Acceleration Resistance
mr = Vm / i_total^2; 
Fa = (mr + Vm)*rdyn;% excluding acceleration

% % Running Simulink Model
sim('DTCS_RemoteWork_S2310787019.slx')

% Resulting Figure
Plot1 = ScopeData.signals(1).values;
Plot2 = ScopeData.signals(2).values;
Time = ScopeData.time;
figure;
plot(Time,Plot1, 'b');
hold on;
plot(Time,Plot2, 'r');
hold off;
xlabel('Time (s)');
ylabel('Speed (km/h)');
title('WLTP cycle using PID controller for BEV');
legend('WLTP Data', 'WLTP with PID');
grid on;
