%{
%File: main.m
%Project: Lab 1
%File Created: Thursday, 19th November 2020 8:14:28 AM
%Author: nknab
%Email: bkojo21@gmail.com
%Version: 1.0
%Brief:
%-----
%Last Modified: Sunday, 6th December 2020 9:24:19 PM
%Modified By: nknab
%-----
%Copyright ©2020 nknab
%}
close all
clear all
clc

% Making sure the figure window appears in fullscreen.
fig = gcf;
fig.Units = 'normalized';
fig.OuterPosition = [0 0 1 1];

%% 1 Random Variables

% 1.1 A few univariate distributions
univariateDist([100; 4000]);
