function [harrisPoints, xDer, yDer] = harrisDetector(sigmaArray, xDer, yDer)    
    nStages = size(sigmaArray, 2);    
    harrisPoints = zeros(0, 3);
       
    for i = 1 : nStages
        currSigma = sigmaArray(i);       
        [xDer2, yDer2, xyDer] = computeAutoCorrelationMatrix(xDer(:, :, i),...
                                                             yDer(:, :, i),...
                                                             currSigma);
        points = (xDer2 .* yDer2 - xyDer .^ 2) ./ (xDer2 + yDer2 + eps);
        
        [~, ~, maxVal] = findLocalMax(points, 3 * currSigma);
        
        threshold = 0.05 * max(maxVal(:));
        
        [x, y] = find(maxVal >= threshold);
        
        foundPointsN = size(x, 1);
        harrisPoints(end + 1 : end + foundPointsN, :) = [x, y, repmat(i, [foundPointsN, 1])];
        
    end
end

