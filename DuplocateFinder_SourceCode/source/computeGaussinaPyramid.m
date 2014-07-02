function [xPyramid, yPyramid] = computeGaussinaPyramid(grayImg, sigmaArray, nStages)
    
    [x, y] = size(grayImg);
    xPyramid = zeros(x, y, nStages);
    yPyramid = zeros(x, y, nStages);
    
    for i = 1 : nStages        
        [dx, dy] = computeMasks(sigmaArray(i));
        
        xPyramid(:, :, i) = conv2(grayImg, dx, 'same');
        yPyramid(:, :, i) = conv2(grayImg, dy, 'same');    
%         xPyramid(:, :, i) = imfilter(grayImg, dx, 'conv');
%         yPyramid(:, :, i) = imfilter(grayImg, dy, 'conv');    
    end

end

