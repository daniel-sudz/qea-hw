function [fit_seg_start, fit_seg_end, fit_inliers, fit_outliers] = sack(scan_data, d, n)
    % init return state format
    fit_seg_start = [-1; -1]; 
    fit_seg_end = [-1; -1]; 
    fit_inliers = []; 
    fit_outliers = [];

    % poll random points for RANSACK
    for iter=1:n
        index_1 = (randi(size(scan_data,1),1));
        index_2 = (randi(size(scan_data,1),1));
        seg_start = scan_data(index_1, :)';
        seg_end = scan_data(index_2, :)';
        
        % inliers/outliers based on input threshold on orthogonal distance
        inliers = filter_by_row(scan_data, @(point) (project_point(seg_start, seg_end, point') <= d));
        outliers = filter_by_row(scan_data,  @(point) (project_point(seg_start, seg_end, point') > d));
        
        % save the best solution
        if(size(inliers, 1) > size(fit_inliers, 1))
            fit_seg_start = seg_start;
            fit_seg_end = seg_end;
            fit_inliers = inliers;
            fit_outliers = outliers; 
        end
    end
end