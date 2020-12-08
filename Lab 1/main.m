%{
%File: main.m
%Project: Autonomous Vehicles Lab | Random Variables
%File Created: Thursday, 19th November 2020 8:14:28 AM
%Authors: Rudra Patel
%         Kojo Anyinam-Boateng
%Emails: rudra.patel@eleves.ec-nantes.fr
%        kojo.anyinam-boateng@eleves.ec-nantes.fr
%Version: 1.0
%Brief:
%-----
%Last Modified: Tuesday, 8th December 2020 12:44:53 PM
%Modified By: Kojo Anyinam-Boateng
%-----
%Copyright ©2020 Rudra Patel & Kojo Anyinam-Boateng
%}

close all
clear all
clc

% Random Variables
%% 1.1 A few univariate distributions

univariateDist([100; 4000]);

% Making sure the figure window appears in fullscreen.
fig = gcf;
fig.Units = 'normalized';
fig.OuterPosition = [0 0 1 1];

%% 1.2 Joint distribution
nr = 200;
sigma_1 = 2;
sigma_2 = 5;
rho = 0.9;
P0 = 0.91;
m = .95;

C = [(sigma_1)^2, rho * (sigma_1 * sigma_2); rho * (sigma_1 * sigma_2), (sigma_2)^2];
theta = linspace(0, 2 * pi, 100);

X = sqrt(-2 * log(1 - P0)) * chol(C, 'lower') * [cos(theta); sin(theta)] + m * ones(1, length(theta));
x = chol(C, 'lower') * randn(length(C), nr) + m * ones(1, nr);

figure('Name', 'Joint Distributions');
dist = plot(x(1, :), x(2, :), '*', 'LineWidth', 1);
hold on
confE = plot(X(1, :), X(2, :), 'LineWidth', 2);
legend([dist confE], 'Distribution', 'Confidence Ellipse', 'FontSize', 12);
title("Joint Distribution with 91% Confidence Ellipse");

% Making sure the figure window appears in fullscreen.
fig = gcf;
fig.Units = 'normalized';
fig.OuterPosition = [0 0 1 1];
