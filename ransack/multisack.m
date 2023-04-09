% runs sequential RANSACK operations to fit several line segments
function [fit_segs_start, fit_segs_end] = multisack(scan_data, d, g, n)
    fit_segs_start = []; 
    fit_segs_end = [];
    outliers = scan_data;
    % try to process model for some number of iterations
    for iter=1:20
        % new model found
        [fit_seg_start, fit_seg_end, fit_inliers, fit_outliers] = sack(outliers, d, g, n);
        if(size(fit_inliers, 1) > 1)
            fit_segs_start = [fit_segs_start; fit_seg_start(1) fit_seg_start(2)];
            fit_segs_end = [fit_segs_end; fit_seg_end(1) fit_seg_end(2)];
            outliers = fit_outliers;
        end
        % processed all
        if(size(outliers, 1) == 0)
            break;
        end
        size(outliers, 1)
    end
    outliers
end