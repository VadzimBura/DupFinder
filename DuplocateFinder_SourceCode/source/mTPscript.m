sigma0 = 1.5;
sigmaStep = 1.2;
nStages = 6;
sigmaArray = sigma0 * ( sigmaStep .^ (0 : nStages - 1));
dLen = 256;

makeTestPairs(dLen, sigmaArray);