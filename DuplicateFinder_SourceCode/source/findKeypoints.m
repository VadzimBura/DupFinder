function orientedKeypoints = findKeypoints(grayImg, sigmaArray, xDer, yDer)
    hPoints = harrisDetector(sigmaArray, xDer, yDer);
    keypoints = laplaceDetector(grayImg, hPoints, sigmaArray);
    orientedKeypoints = computeMainOrient(keypoints, xDer, yDer);
end

