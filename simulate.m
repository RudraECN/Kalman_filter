%{
%File: simulate.m
%Project: Autonomous Vehicles Lab | Kalman Filter
%File Created: Monday, 30th November 2020 4:12:35 PM
%Authors: Rudra Patel
%         Kojo Anyinam-Boateng
%Emails: rudra.patel@eleves.ec-nantes.fr
%        kojo.anyinam-boateng@eleves.ec-nantes.fr
%Version: 1.0
%Brief:
%-----
%Last Modified: Tuesday, 8th December 2020 10:47:11 AM
%Modified By: Kojo Anyinam-Boateng
%-----
%Copyright ©2020 Rudra Patel & Kojo Anyinam-Boateng
%}

function [y, X] = simulate(u, G, T, Ts, L, x1)

    x = x1;
    A = [0 1; 0 -1 / T];
    B = [0; G / T];
    C = [1 0];
    D = 0;

    [Ad, Bd, Cd, Dd] = c2dm(A, B, C, D, Ts, 'zoh');

    n = length(u);
    y = zeros(1, n);
    X = zeros(2, n);

    for index = 1:n

        y(index) = Cd * x;
        X(:, index) = x;
        x = Ad * x + Bd * u(index);

    end

    y = round(y * L / 2 / pi) * 2 * pi / L;

end
