clear all
close all
clc

A1 = 0.1;
Ts =1*10^-3;
Delta = 100*10^-3;
D1 = 1;
G = 50;
T = 20*10^-3;
Tf = 20*10^-3;
L = 512;
q = 0.5;
x1 = [0;0];
x1_0 = [1.5;0];
p1_0 = [(2*pi)^2/12 0;0 0];

u = inputvoltage(D1,A1,Delta,Ts);

[y,X] = simulates(u,G,T,Ts,L,x1);

[X_E] = kalmann_filter(y,u,G,Tf,Ts,L,x1_0,p1_0,q);
errortheta = X_E(1,:) -X(1,:);

figure(2)
subplot(3,1,1)
plot ((0:Ts:D1),X_E(1,:),'r');

hold on
plot ((0:Ts:D1),X(1,:),'b');
ylabel('theta')
xlabel('Time in seconds')
title('Comparing  ')
 
 
subplot(3,1,2)
plot ((0:Ts:D1),X_E(2,:),'r');
hold on

plot ((0:Ts:D1),X(2,:),'b');
ylabel('Error')
xlabel('Time in seconds')
title('Comparing the Error using the Kalmann filter ')

subplot(3,1,3)
plot ((0:Ts:D1),errortheta);
ylabel('Error')
xlabel('Time in seconds')
title('Comparing the Error using the Kalmann filter ')

[X2]=Stationary_Kalman(y,u,G,T,Ts,L,x1_0,p1_0,q);
figure(3)
subplot(2,1,1)
plot ((0:Ts:D1),X2(1,:),'r');

hold on
plot ((0:Ts:D1),X(1,:),'b');
ylabel('theta')
xlabel('Time in seconds')
title('Comparing the state vector using the Stationary Kalmann filter ')
errortheta2 = X2(1,:) - X(1,:);
subplot(2,1,2)
plot ((0:Ts:D1),errortheta2);
ylabel('Error')
xlabel('Time in secomds')
title('Comparing the Error when the Stationary Kalmann filter ')