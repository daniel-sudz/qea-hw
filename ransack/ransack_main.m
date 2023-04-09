clear all; close all;

% verified point and line projection with some test point: 
% https://www.wolframalpha.com/input?i=distance+between+line+y%3D2x*3+%2B+1+and+%284%2C-12%29
project_point([1; 6 + 1], [2; 12 + 1], [4; -12]);

% test our ransack function with data from homework
load("playpensample.mat");
scan_data = [r .* cosd(theta), r .* sind(theta)];
scan_data = filter_by_row(scan_data, @(x) (x(1)));

%figure(); 
%scatter(scan_data(:,1), scan_data(:,2));

[fit_seg_start, fit_seg_end, fit_inliers, fit_outliers] = sack(scan_data, 0.1, 0.3, 100);
figure(); hold on;
plot_in = scatter(fit_inliers(:,1), fit_inliers(:,2), 'green');
plot_out = scatter(fit_outliers(:,1), fit_outliers(:,2), 'red');
fit_slope = (fit_seg_end(2) - fit_seg_start(2)) / (fit_seg_end(1) - fit_seg_start(1));
fit_intercept = fit_seg_start(2) - fit_slope*fit_seg_start(1);
fit_func = @(x) (x*fit_slope + fit_intercept);
fit_range = 0.5:0.1:1.5;
plot_fit = plot(fit_range, arrayfun(fit_func, fit_range), 'black');
legend([plot_in, plot_out, plot_fit], sprintf("inliers=%d",size(fit_inliers,1)),  sprintf("outliers=%d",size(fit_outliers,1)), "fit line");

