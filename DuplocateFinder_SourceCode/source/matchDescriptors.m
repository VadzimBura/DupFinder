function descPairs = matchDescriptors(desc1, desc2, x1, x2, y1, y2)    
    desc1Size = size(desc1, 1);
    desc2Size = size(desc2, 1);
    
    temp1 = normCoords(desc1, desc1Size, x1, x2, y1, y2);
    temp2 = normCoords(desc2, desc2Size, x2, x1, y2, y1);
    
    descPairs12 = matchLeft(temp1, temp2, desc1Size, desc2Size);
    descPairs21 = matchLeft(temp2, temp1, desc2Size, desc1Size);
    
    a = (descPairs12(:, 1) == descPairs21(:, 2)) &...
             (descPairs12(:, 1) ~= 0) &...
             (descPairs21(:, 2) ~= 0);
         
    descPairs = descPairs12(a(:, 1) ~= 0, :);
   
end

function descPairs = matchLeft(temp1, temp2, desc1Size, desc2Size)
    ind = 1;
    
    maxSize = max(desc1Size, desc2Size);   
    descPairs = zeros(maxSize, 2);
    
    for i = 1 : desc1Size        
        dist = sqrt(sum(((temp2 - repmat(temp1(i, :), desc2Size, 1)) .^ 2), 2));
        [minDist, index] = sort(dist);
        sz = find(descPairs(:, 2) == index(1));

        if minDist(1) <  minDist(2) * 0.6 && size(sz, 1) == 0
          descPairs(ind, :) = [i, index(1)];
          ind = ind + 1;
        end
    end

end


function rotC = normCoords(desc1, desc1Size, x1, x2, y1, y2)
    rotC = zeros(desc1Size, 2);
    for i = 1 : desc1Size    
         rotC(i, :) = desc1(i, 1 : 2) ./ desc1(i, 3);
         rotC(i, 1) = rotC(i, 1) .* cos(0 - desc1(i, 4)) - rotC(i, 1) .* sin(0 - desc1(i, 4));
         rotC(i, 2) = rotC(i, 2) .* sin(0 - desc1(i, 4)) + rotC(i, 2) .* cos(0 - desc1(i, 4));
        if x1 < x2
            rotC(i, 1) = rotC(i, 1) * x2 / x1;
        end
         if y1 < y2
            rotC(i, 2) = rotC(i, 2) * y2 / y1;
        end
    end
end

