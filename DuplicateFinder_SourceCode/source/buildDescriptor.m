function descriptor = buildDescriptor(image, x, y, angle, testPairs, dLen)        
    descriptor = zeros(1, dLen);
    
    for i = 1 : dLen   
        
        testPairs(i, 1) = ceil(testPairs(i, 1) .* cos(0 - angle) - testPairs(i, 1) .* sin(0 - angle));        
        testPairs(i, 3) = floor(testPairs(i, 3) .* cos(0 - angle) - testPairs(i, 3) .* sin(0 - angle));
        testPairs(i, 2) = ceil(testPairs(i, 2) .* sin(0 - angle) + testPairs(i, 2) .* cos(0 - angle));
        testPairs(i, 4) = floor(testPairs(i, 4) .* sin(0 - angle) + testPairs(i, 4) .* cos(0 - angle));
        
        fOffsetX = x + testPairs(i, 1); 
        fOffsetY = y + testPairs(i, 2);
        sOffsetX = x + testPairs(i, 3);
        sOffsetY = y + testPairs(i, 4);
        
        nextBit = (image(fOffsetX, fOffsetY) < image(sOffsetX, sOffsetY));
        descriptor(:, dLen - i + 1) = nextBit;
    end
end

