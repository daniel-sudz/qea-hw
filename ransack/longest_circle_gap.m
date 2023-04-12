% Determines the longest angle gap in the circle model
function [distance] = longest_circle_gap(circle_origin, inlier_points)
    % convert to vector form
    inlier_points = map_by_row(inlier_points, @(point) (point - circle_origin'));

    % horizontal vector 
    horizontal_vector = [0; 1];

    % calculate angles
    angles =  map_by_row(inlier_points, @(point) (acos((point * horizontal_vector) ./ (norm(point)*norm(horizontal_vector)))));

    % find max gap 
    distance = max(diff(sort(angles))); 
end