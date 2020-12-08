%{
%File: plotHistNSig.m
%Project: Autonomous Vehicles Lab | Random Variables
%File Created: Tuesday, 8th December 2020 11:58:47 AM
%Authors: Rudra Patel
%         Kojo Anyinam-Boateng
%Emails: rudra.patel@eleves.ec-nantes.fr
%        kojo.anyinam-boateng@eleves.ec-nantes.fr
%Version: 1.0
%Brief:
%-----
%Last Modified: Tuesday, 8th December 2020 12:49:36 PM
%Modified By: Kojo Anyinam-Boateng
%-----
%Copyright ©2020 Rudra Patel & Kojo Anyinam-Boateng
%}

function plotHistNSig(data, m, s, colour, nPlot, i1, i2, sigBounds, distType, N)
    hold off;
    subplot(3, nPlot, i1)
    histogram(data, 'Normalization', 'pdf', 'FaceColor', colour)
    xline(m, '-k', 'LineWidth', 2, 'label', 'mean');
    xline(s, '--k', 'LineWidth', 2, 'label', 'std');
    xline(-s, '--k', 'LineWidth', 2, 'label', 'std');
    titl = sprintf(distType + ", N = " + N + "\n Mean = " + m + " Standard Deviation = " + s);
    title(titl);

    hold off;
    subplot(3, nPlot, i2)
    plot(sigBounds, data, 'color', colour)
    titl = sprintf("N = " + N + " Realizations as an \nIndependent Random Signal");
    title(titl)
end
