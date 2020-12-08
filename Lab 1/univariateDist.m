%{
%File: univariateDist.m
%Project: Autonomous Vehicles Lab | Random Variables
%File Created: Thursday, 19th November 2020 8:32:56 AM
%Authors: Rudra Patel
%         Kojo Anyinam-Boateng
%Emails: rudra.patel@eleves.ec-nantes.fr
%        kojo.anyinam-boateng@eleves.ec-nantes.fr
%Version: 1.0
%Brief:
%-----
%Last Modified: Tuesday, 8th December 2020 12:46:04 PM
%Modified By: Kojo Anyinam-Boateng
%-----
%Copyright ©2020 Rudra Patel & Kojo Anyinam-Boateng
%}

function univariateDist(Ns)
    n = size(Ns, 1);
    nPlot = n * 2;

    for index = 1:n
        N = Ns(index);

        % Defining the Gausssian Distribution.
        gaussian = randn(N, 1);

        % Defining the Uniform Distribution.
        uniform = 2 * sqrt(3) * (rand(N, 1) - 0.5);

        % Defining Symmetric Gaussian Mixture
        m = .95;
        sym_gaus_mix = randn(N, 1) * sqrt(1 - m * m) + m;
        k = find(randn(N, 1) > 0.5);
        sym_gaus_mix(k) = sym_gaus_mix(k) - 2 * m;

        % Finding the Mean of the Various distributions,
        gaussian_mean = mean(gaussian);
        uniform_mean = mean(uniform);
        sym_gaus_mix_mean = mean(sym_gaus_mix);

        % Finding the Standard Deviation of the Various distributions,
        gaussian_std = std(gaussian);
        uniform_std = std(uniform);
        sym_gaus_mix_std = std(sym_gaus_mix);

        sigBounds = linspace(0, N, N);

        i1 = (2 * n) - 1 - (2 * (index - 1));
        i2 = (2 * n) - 2 - (2 * (index - 1));

        plotHistNSig(gaussian, gaussian_mean, gaussian_std, '#E1341E', nPlot, (2 * n) - i1, (2 * n) - i2, sigBounds, "Normal Disribution", N);

        plotHistNSig(uniform, uniform_mean, uniform_std, '#2A5AD5', nPlot, (4 * n) - i1, (4 * n) - i2, sigBounds, "Uniform Disribution", N);

        plotHistNSig(sym_gaus_mix, sym_gaus_mix_mean, sym_gaus_mix_std, '#07BD19', nPlot, (6 * n) - i1, (6 * n) - i2, sigBounds, "Gaussian Mixture Disribution", N);

    end

end
