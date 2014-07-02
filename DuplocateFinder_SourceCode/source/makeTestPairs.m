function testPairs = makeTestPairs(dLen, sigmaArray)
    nStages = size(sigmaArray, 2);
    testPairs = zeros(dLen, 4, nStages);

    for i = 1 : nStages    
        s = sigmaArray(i);    
        temp = makeTestPattern(3 * s, dLen);
        testPairs(:, :, i) = temp; 
    end
    
    save('testPairs.mat', 'testPairs');
end

