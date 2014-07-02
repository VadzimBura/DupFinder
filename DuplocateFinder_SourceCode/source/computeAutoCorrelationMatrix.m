function [xDer2, yDer2, xyDer] = computeAutoCorrelationMatrix( xDer, yDer, stdDev )
    gaussian = fspecial('gaussian', max(1, fix(6 * stdDev + 1)), stdDev);
%     
%     xDer2 = conv2(xDer .^ 2, gaussian, 'same');
%     yDer2 = conv2(yDer .^ 2, gaussian, 'same');
%     xyDer = conv2(xDer .* yDer, gaussian, 'same');
    xDer2 = imfilter(xDer .^ 2, gaussian, 'conv');
    yDer2 = imfilter(yDer .^ 2, gaussian, 'conv');
    xyDer = imfilter(xDer .* yDer, gaussian, 'conv');

end

