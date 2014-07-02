function keypoints = laplaceDetector(img, harrisPoints, sigmaArray)

    nStages = size(sigmaArray, 2);
    laplaceOper = zeros(size(img, 1), size(img, 2), nStages);   
    
    for i = 1 : nStages
        currSigma = sigmaArray(i);
        laplaceOper(:, :, i) = currSigma ^ 2  * imfilter(img, ...
                                fspecial('log', floor(6 * currSigma + 1), ...
                                currSigma), 'replicate');
    end
    
    harrisPointsN = size(harrisPoints, 1);
    keypoints = zeros(harrisPointsN, 3);
    kpIndex = 1;
    
    for i = 1 : harrisPointsN        
        x = harrisPoints(i, 1);
        y = harrisPoints(i, 2);
        stage = harrisPoints(i, 3);
        
        laplaceVal = laplaceOper(x, y, stage);
        
        switch stage
            case 1
                if laplaceVal > laplaceOper(x, y, stage + 1)
                    keypoints(kpIndex, :) = harrisPoints(i, :);
                    kpIndex = kpIndex + 1;
                end
            case nStages
                if laplaceVal > laplaceOper(x, y, stage - 1)
                    keypoints(kpIndex, :) = harrisPoints(i, :);
                    kpIndex = kpIndex + 1;
                end
            otherwise
                if (laplaceVal > laplaceOper(x, y, stage - 1)) && ...
                        (laplaceVal > laplaceOper(x, y, stage + 1))
                    
                    keypoints(kpIndex, :) = harrisPoints(i, :);
                    kpIndex = kpIndex + 1;
                end
        end
    end
    
    keypoints(kpIndex : end, :) = [];
    
end

