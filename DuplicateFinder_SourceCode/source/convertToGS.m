function gsImage = convertToGS(originalImage)

    gsImage = im2double(originalImage);
    gsImage = rgb2gray(gsImage);
end

