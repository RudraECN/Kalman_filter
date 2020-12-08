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

        titl = "Normal Disribution with mean " + gaussian_mean + " and std " + gaussian_std;
        plotHistNSig(gaussian, gaussian_mean, gaussian_std, '#E1341E', titl, nPlot, (2 * n) - i1, (2 * n) - i2, sigBounds);

        titl = "uniform disribution with mean " + uniform_mean + " and std " + uniform_std;
        plotHistNSig(uniform, uniform_mean, uniform_std, '#FFEC00', titl, nPlot, (4 * n) - i1, (4 * n) - i2, sigBounds);

        titl = "Gaussian mixturer disribution with mean " + sym_gaus_mix_mean + " and std " + sym_gaus_mix_std;
        plotHistNSig(sym_gaus_mix, sym_gaus_mix_mean, sym_gaus_mix_std, '#07BD19', titl, nPlot, (6 * n) - i1, (6 * n) - i2, sigBounds);

    end

end
