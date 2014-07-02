function descriptors = extractDescriptors(grayImg, keypoints, testPairs, dLen)
    kpN = size(keypoints(:, 3), 1);
    descriptors = zeros(kpN, dLen);
    
    padVal = max(keypoints(:, 3));
    padVal = ceil(3 * padVal);
    
    keypoints(:, [1 2]) = keypoints(:, [1 2]) + padVal;
    grayImg = padarray(grayImg, [padVal padVal], 'symmetric');
    
    img = cumsum(cumsum(grayImg, 2));    
    
    for i = 1 : kpN
        scale = keypoints(i, 3);        
        descriptors(i, :) = buildDescriptor(img,...
                                            keypoints(i, 1),...
                                            keypoints(i, 2),...
                                            keypoints(i, 4),...
                                            testPairs(:, :, scale),...
                                            dLen);
    end
end

