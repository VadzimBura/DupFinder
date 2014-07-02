function [ x, y, maxValue ] = findLocalMax( points, radius )
    mask = fspecial('disk', radius) > 0;
    tempPoints = imdilate(points, mask);
    index = (points == tempPoints);
    [x, y] = find(index == 1);
    maxValue = zeros(size(points));
    maxValue(index) = points(index);

%     mask  = fspecial('disk',radius)>0;
%     nb    = sum(mask(:));
%     highest          = ordfilt2(points, nb, mask);
%     second_highest   = ordfilt2(points, nb-1, mask);
%     index            = highest==points & highest~=second_highest;
%     maxValue        = zeros(size(points));
%     maxValue(index) = points(index);
%     [x, y]        = find(index==1);

end

