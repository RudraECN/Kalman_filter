clear all
close all
clc

A1 = 0.1;
Ts =1*10^-3;
Delta = 100*10^-3;
D1 = 1;
G = 50;
T = 20*10^-3;
Tf = 25*10^-3;
L = 512;
q = 5*10^-9;
x1 = [0.05;0];
x1_0 = [0.05;0];
p1_0 = [0.1 0;0 0];

u = inputvoltage(D1,A1,Delta,Ts);

[y,X] = simulates(u,G,T,Ts,L,x1);

%Normal kalman filter
[X_E] = kalmann_filter(y,u,G,Tf,Ts,L,x1_0,p1_0,q);
errortheta = X_E(1,:) -X(1,:);
figure(2)
subplot(3,1,1)
%plotting the op of kalman with the simulation
plot ((0:Ts:D1),X_E(1,:),'r');
hold on
%theta is the first element
plot ((0:Ts:D1),X(1,:),'b');
ylabel('theta')
xlabel('Time in seconds')
title('Comparing Theta from Kalman filter and Simulation')
subplot(3,1,2)
plot ((0:Ts:D1),X_E(2,:),'r');
hold on
%omega is the second
plot ((0:Ts:D1),X(2,:),'b');
ylabel('Error')
xlabel('Time in seconds')
title('Comparing Omega from Kalman filter and Simulation')
subplot(3,1,3)
plot ((0:Ts:D1),errortheta);
ylabel('Error')
xlabel('Time in seconds')
title(' y  ')

%stationary Kalman filter
[X2]=Stationary_Kalman(y,u,G,Tf,Ts,L,x1_0,p1_0,q);
figure(3)
subplot(3,1,1)
plot ((0:Ts:D1),X2(1,:),'r');
hold on
plot ((0:Ts:D1),X(1,:),'b');
ylabel('theta')
xlabel('Time in seconds')
title('Comparing Theta from Stationary Kalman filter and Simulation ')
errortheta2 = X2(1,:) - X(1,:);
subplot(3,1,2)
plot ((0:Ts:D1),X2(2,:),'r');
hold on
plot ((0:Ts:D1),X(2,:),'b');
ylabel('Omega')
xlabel('Time in seconds')
title('Comparing Omega from Stationary Kalman filter and Simulation ')

subplot(3,1,3)
plot ((0:Ts:D1),errortheta2);
ylabel('Error')
xlabel('Time in secomds')
title('y')