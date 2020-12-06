function u = inputvoltage(D,A,Delta,Ts)

t=0:Ts:D;
f = 1/Delta;
u = A*(square(2*pi*f*t));


% plot(t,u)
% ylabel('Input voltage')
% xlabel('Time in seconds')
% title('Input Square wave')
end



