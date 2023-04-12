function [fit_circle_start, fit_circle_rad, fit_inliers, fit_outliers] = sack_circle(scan_data, d, min_points, n)
    % init return state format
    fit_circle_start = [-1; -1]; 
    fit_circle_rad = -1;
    fit_inliers = []; 
    fit_outliers = [];

    for iter=1:n
        % poll 3 random points for circle model
        index_1 = (randi(size(scan_data,1),1));
        index_2 = (randi(size(scan_data,1),1));
        index_3 = (randi(size(scan_data,1),1));
        if(index_1 ~= index_2 && index_1 ~= index_3 && index_2 ~= index_3)
            % fit a circle to the 3 points by solving linear system
            % based on linearlization of circle equation compendium
            point_1 = scan_data(index_1, :);
            point_2 = scan_data(index_2, :);
            point_3 = scan_data(index_3, :);
            A = [
                2*point_1(1) 2*point_1(2) -1;
                2*point_2(1) 2*point_2(2) -1;
                2*point_3(1) 2*point_3(2) -1;
            ];
            b = [
                    point_1(1).^2 + point_1(2).^2;
                    point_2(1).^2 + point_2(2).^2
                    point_3(1).^2 + point_3(2).^2
            ];
            % see writeup for the derivation of this linear system
            warning('error', 'MATLAB:singularMatrix');
            warning('error', 'matlab:nearlySingularMatrix');
            try
               w = A\b; 
            catch INV_ERROR
                if (strcmp(INV_ERROR.identifier,'MATLAB:singularMatrix'))
                    disp("error");
                    continue;
                elseif (strcmp(INV_ERROR.identifier,'matlab:nearlySingularMatrix'))
                    disp("error");
                    continue;
         
                end
            end
       
            circle_rad = sqrt(w(1).^2 + w(2).^2 - w(3));
            circle_start = [w(1); w(2)];

            loss_function = @(point) (sqrt(abs((point(1) - circle_start(1)).^2 + (point(2) - circle_start(2)).^2 - circle_rad.^2)));
            accept_inlier = @(point) (loss_function(point) <= d);

            % inliers/outliers based on input threshold on orthogonal distance
            inliers = filter_by_row(scan_data, accept_inlier);
            outliers = filter_by_row(scan_data, negate_fun(accept_inlier));
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