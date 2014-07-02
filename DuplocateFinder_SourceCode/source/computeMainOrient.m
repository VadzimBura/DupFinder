function orientedKeypoints = computeMainOrient(keypoints, xDer, yDer)
    scales = unique(keypoints(:, 3));
    nScales = length(scales);    
    padVal = max(scales);
    padVal = ceil(3 * padVal);
    binStep = 30;
    histBins = 0 : binStep : 360;
     
    xDer = padarray(xDer, [padVal padVal], 'symmetric');     
    yDer = padarray(yDer, [padVal padVal], 'symmetric');
    
    keypoints(:, [1 2]) = keypoints(:, [1 2]) + padVal;
    
    orientedKeypoints = zeros(0, 4);    
    ind = 1;
    
    for i = 1 : nScales
        kpInCurrScale = find(keypoints(:, 3) == scales(i));
        nKeypoints = size(kpInCurrScale, 1);
        offset = 3 * scales(i);      
        
        for j = 1 : nKeypoints
            currKP = keypoints(kpInCurrScale(j), [1 2 3]);            
            orientedKeypoints(ind, [1 2 3]) = currKP([1 2 3]);
  
            kpNeighborhoodX = xDer(currKP(1,1) - offset : currKP(1,1) + offset, currKP(1,2));
            kpNeighborhoodY = yDer(currKP(1,1), currKP(1,2) + offset : currKP(1,2) + offset);            
            gradAngles = rad2deg(atan2(kpNeighborhoodY, kpNeighborhoodX) + pi);
            histogram = histc(gradAngles, histBins);

            [~, m] = max(histogram);
            kpOrient = histBins(m);
            orientedKeypoints(ind, 4) = kpOrient;
%             orientedKeypoints(ind, 4) = findKPOrient(currKP, offset,...
%                                                     xDer(:, :, i),...
%                                                     yDer(:, :, i));
            ind = ind + 1;
        end
    end
    
    orientedKeypoints(:, [1 2]) = orientedKeypoints(:, [1 2]) - padVal;
end

function kpOrient = findKPOrient(currKP, offset, xDer, yDer)

    binStep = 30;
    histBins = 0 : binStep : 360;

    kpNeighborhoodX = xDer(currKP(1,1) - offset : currKP(1,1) + offset, currKP(1,2));
    kpNeighborhoodY = yDer(currKP(1,1), currKP(1,2) + offset : currKP(1,2) + offset);            
    gradAngles = rad2deg(atan2(kpNeighborhoodY, kpNeighborhoodX) + pi);
    histogram = histc(gradAngles, histBins);

    [~, m] = max(histogram);
    kpOrient = histBins(m);

end

