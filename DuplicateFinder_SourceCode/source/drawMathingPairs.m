function  drawMathingPairs(inImage, descPairs, ...
                                      keypoints1, keypoints2, y1 )
    sz = size(descPairs, 1);
    figure, imshow(inImage);
    hold on;    
    axis off;
    
    for i = 1 : size(keypoints1, 1)
        a =  [keypoints1(i, 2) - keypoints1(i, 3),...
            keypoints1(i, 1) - keypoints1(i, 3), 2 * keypoints1(i, 3),...
            2 * keypoints1(i, 3)];
        rectangle('Position', a, 'Curvature', [1, 1],...
                    'EdgeColor', 'r', 'LineWidth' , 2);
    end

    for i = 1 : size(keypoints2, 1)
        a =  [keypoints2(i, 2) - keypoints2(i, 3) + y1,...
            keypoints2(i, 1) - keypoints2(i, 3), 2 * keypoints2(i, 3),...
            2 * keypoints2(i, 3)];
        rectangle('Position', a, 'Curvature', [1, 1],...
                    'EdgeColor', 'r', 'LineWidth' , 2);
    end
    
    for i = 1 : sz
        line([keypoints1(i, 2) keypoints2(descPairs(i, 2), 2) + y1], ...
            [keypoints1(i, 1) keypoints2(descPairs(i, 2), 1)], 'Color', 'b');
    end
    
    hold off;
end

