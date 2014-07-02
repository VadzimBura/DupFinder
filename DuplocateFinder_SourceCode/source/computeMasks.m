function [dx, dy] = computeMasks(stdDev)

    x = -3 * round(stdDev) : 3 * round(stdDev);
    dx = x .* exp(-x .* x / (2 * stdDev * stdDev)) ./ (stdDev * stdDev * stdDev * sqrt(2 * pi ));
    dy = dx';
end

