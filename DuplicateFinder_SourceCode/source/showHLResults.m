Img = imread('2.bmp');
grayImg = convertToGS(Img);

sigma0 = 1.1;
sigmaStep = 1.2;
nStages = 6;
sigmaArray = sigma0 * ( sigmaStep .^ (0 : nStages - 1));

[xDer, yDer] = computeGaussinaPyramid(grayImg, sigmaArray * 0.7, nStages); 
keypoints = findKeypoints(grayImg,  sigmaArray, xDer, yDer);
draw(Img, keypoints);