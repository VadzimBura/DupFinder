function testPairs = makeTestPattern(radius, descLen)
    
    pairs = randi([ceil(-radius/2),floor(radius/2)], descLen, 4);
    
    testPairs(:,2) = pairs(:,2) + ceil(radius/2);
    testPairs(:,4) = pairs(:,4) + ceil(radius/2);
    testPairs(:,1) = mod(ceil(radius/2)-pairs(:,1), round(radius));
    testPairs(:,3) = mod(ceil(radius/2)-pairs(:,3), round(radius));
    
    for iRow = 1:length(testPairs(:,1))
        if(0 == testPairs(iRow,1))
            testPairs(iRow,1) = round(radius);
        end
        if(0 == testPairs(iRow,3))
            testPairs(iRow,3) = round(radius);
        end
    end
end