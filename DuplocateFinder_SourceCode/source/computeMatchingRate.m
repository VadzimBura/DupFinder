function matchingRate = computeMatchingRate(desc1, desc2, descPairs)
    overallDist = 0;
    
    if size(descPairs, 1) == 0
        matchingRate = 0;
        return
    end
    for i = 1 : size(descPairs, 1)        
        d1 = descPairs(i, 1);
        d2 = descPairs(i, 2);        
        overallDist = overallDist + computeHammingDistance(desc1(d1, :),...
                                                            desc2(d2, :));
    end
    
    matchingRate =  1 - overallDist / (size(desc1, 2) * size(descPairs, 1));
    
%    if matchingRate < 0.75
%        matchingRate = matchingRate - 0.3;
%    end
end

