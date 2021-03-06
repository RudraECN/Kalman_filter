%{
%File: main.m
%Project: Autonomous Vehicles Lab | Kalman Filter
%File Created: Thursday, 19th November 2020 8:14:28 AM
%Authors: Rudra Patel
%         Kojo Anyinam-Boateng
%Emails: rudra.patel@eleves.ec-nantes.fr
%        kojo.anyinam-boateng@eleves.ec-nantes.fr
%Version: 1.0
%Brief:
%-----
%Last Modified: Tuesday, 8th December 2020 10:58:15 AM
%Modified By: Kojo Anyinam-Boateng
%-----
%Copyright ©2020 Rudra Patel & Kojo Anyinam-Boateng
%}

clear all
close all
clc

A1 = 0.1;
Ts = 1 * 10^ - 3;
Delta = 100 * 10^ - 3;
D1 = 1;
G = 50;
T = 20 * 10^ - 3;
Tf = 25 * 10^ - 3;
L = 512;
q = 5 * 10^ - 9;
x1 = [0.05; 0];
x1_0 = [0.05; 0];
p1_0 = [0.1 0; 0 0];

u = inputvoltage(D1, A1, Delta, Ts);

[y, X] = simulate(u, G, T, Ts, L, x1);

%Normal kalman filter
[X_E] = kal(y, u, G, Tf, Ts, L, x1_0, p1_0, q);
thetaError = X_E(1, :) -X(1, :);

figure('Name', 'Normal Kalman Filter');
subplot(3, 1, 1)
%plotting the op of kalman with the simulation
plot ((0:Ts:D1), X_E(1, :), 'r');

hold on

%theta is the first element
plot ((0:Ts:D1), X(1, :), 'b');
ylabel('theta')
xlabel('Time (s)')
title('Comparing Theta from Kalman Filter and Simulation')

subplot(3, 1, 2)
plot ((0:Ts:D1), X_E(2, :), 'r');

hold on

%omega is the second
plot ((0:Ts:D1), X(2, :), 'b');
ylabel('Error')
xlabel('Time (s)')
title('Comparing Omega from Kalman Filter and Simulation')

subplot(3, 1, 3)
plot ((0:Ts:D1), thetaError);
ylabel('Error')
xlabel('Time (s)')
title(' y  ')

%stationary Kalman filter
[X2] = stationarykal(y, u, G, Tf, Ts, L, x1_0, p1_0, q);

figure('Name', 'Stationary Kalman Filter');
subplot(3, 1, 1)
plot ((0:Ts:D1), X2(1, :), 'r');

hold on

plot ((0:Ts:D1), X(1, :), 'b');
ylabel('theta')
xlabel('Time (s)')
title('Comparing Theta from Stationary Kalman Filter and Simulation ')
thetaError2 = X2(1, :) - X(1, :);

subplot(3, 1, 2)
plot ((0:Ts:D1), X2(2, :), 'r');

hold on

plot ((0:Ts:D1), X(2, :), 'b');
ylabel('Omega')
xlabel('Time (s)')
title('Comparing Omega from Stationary Kalman Filter and Simulation ')

subplot(3, 1, 3)
plot ((0:Ts:D1), thetaError2);
ylabel('Error')
xlabel('Time (s)')
title('y')
