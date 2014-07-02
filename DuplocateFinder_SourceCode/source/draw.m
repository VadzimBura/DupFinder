function draw(image, keypoints)
    figure, imshow(image);
    hold on;
    axis off;
        
    for i = 1 : size(keypoints, 1)
        rectangle('Position', [keypoints(i, 2) - keypoints(i, 3),...
            keypoints(i, 1) - keypoints(i, 3), 2 * keypoints(i, 3),...
            2 * keypoints(i, 3)], 'Curvature', [1, 1], 'EdgeColor',...
            'r', 'LineWidth' , 2);
    end
    
end

