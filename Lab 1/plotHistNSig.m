function plotHistNSig(data, m, s, colour, titl, nPlot, i1, i2, sigBounds)
    hold off;
    subplot(3, nPlot, i1)
    histogram(data, 'Normalization', 'pdf', 'FaceColor', colour)
    xline(m, '-k', 'LineWidth', 2, 'label', 'mean');
    xline(s, '--k', 'LineWidth', 2, 'label', 'std');
    xline(-s, '--k', 'LineWidth', 2, 'label', 'std');
    title(titl);

    hold off;
    subplot(3, nPlot, i2)
    plot(sigBounds, data, 'color', colour)
end
