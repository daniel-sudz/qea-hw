function [fit_circle_start, fit_circle_rad, fit_inliers, fit_outliers] = sack_circle(scan_data, d, min_points, n)
    % init return state format
    fit_circle_start = [-1; -1]; 
    fit_circle_rad = -1;
    fit_inliers = []; 
    fit_outliers = [];

    % poll random points for RANSACK
    for iter=1:n
        index_1 = (randi(size(scan_data,1),1));
        index_2 = (randi(size(scan_data,1),1));
        circle_start = scan_data(index_1, :)';
        circle_rad = norm(circle_start - scan_data(index_2, :)');
        if(index_1 ~= index_2 && circle_rad < 0.2)
            loss_function = @(point) (sqrt(abs((point(1) - circle_start(1)).^2 + (point(2) - circle_start(2)).^2 - circle_rad.^2)));
            
            % inliers/outliers based on input threshold on orthogonal distance
            inliers = filter_by_row(scan_data, @(point)(loss_function(point) <= d));
            outliers = filter_by_row(scan_data,  @(point)(loss_function(point) > d));
            assert(size(inliers,1) + size(outliers,1) == size(scan_data,1));
    
            % check for largest gap threshold
            if(size(inliers, 1) >= min_points)
                % save the best solution
                    fit_circle_start = circle_start;
                    fit_circle_rad = circle_rad;
                    fit_inliers = inliers;
                    fit_outliers = outliers; 
            end
        end
    end
end