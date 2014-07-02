function test(varargin)

if ischar( varargin{1} )
    Img = imread( varargin{1} );
    Img1 = imread( varargin{2} );
else
    Img = varargin{1};
    Img1 = varargin{2};
end

% clear varargin;

sigma0 = 1.5;
sigmaStep = 1.2;
nStages = 6;
sigmaArray = sigma0 * ( sigmaStep .^ (0 : nStages - 1));
dLen = 128;
testPairs = importdata('testPairs.mat');

x1 = size(Img, 1);
y1 = size(Img, 2);
x2 = size(Img1, 1);    
y2 = size(Img1, 2);


grayImg = convertToGS(Img);
[xDer, yDer] = computeGaussinaPyramid(grayImg, sigmaArray * 0.7, nStages); 
keypoints = findKeypoints(grayImg,  sigmaArray, xDer, yDer);
descriptors = extractDescriptors(grayImg, keypoints, testPairs, dLen);


grayImg1 = convertToGS(Img1);
[xDer, yDer] = computeGaussinaPyramid(grayImg1, sigmaArray * 0.7, nStages);
keypoints1 = findKeypoints(grayImg1, sigmaArray, xDer, yDer);
descriptors1 = extractDescriptors(grayImg1, keypoints1, testPairs, dLen);

pairs = matchDescriptors(keypoints, keypoints1, x1, x2, y1, y2);

rate = computeMatchingRate(descriptors, descriptors1, pairs);

figure, axis off, hold on, 
title([varargin{1}, ' is matching ', varargin{2}, ' on rate ', num2str(rate)]);
outImg = appendImages(Img, Img1);
imshow(outImg);

end

