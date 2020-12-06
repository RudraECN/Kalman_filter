function [y,X] = simulates(u,G,T,Ts,L,x1)

x=x1;
A = [0 1; 0 -1/T];
B = [0;G/T];
C = [1 0];
D = [0];

[Ad,Bd,Cd,Dd]=c2dm(A,B,C,D,Ts,'zoh');

n = length(u);
y = zeros(1, n); 
X = zeros(2, n);

for i = 1:n
    y(i) = Cd * x;
    X(:,i) = x; 
    x= Ad * x + Bd * u(i); 

end
y = round(y*L/2/pi)*2*pi/L;
% figure(4)
% hold on
% subplot(3,1,1)
% plot(X(1,:));
% ylabel('theta')
% xlabel('Time (seconds)')
% title('State (Theta) from The simulator')
% subplot(3,1,2)
% plot(X(2,:));
% ylabel('Omega')
% xlabel('Time(seconds)')
% title('State (Omega) from The simulator')
% subplot(3,1,3)
% 
% plot(y);
% ylabel('y')
% xlabel('Time(seconds)')
% title('Measurement (Y) from The simulator')
end

