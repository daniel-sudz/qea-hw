clear all; close all;

% verified point and line projection with some test point: 
% https://www.wolframalpha.com/input?i=distance+between+line+y%3D2x*3+%2B+1+and+%284%2C-12%29
project_point([1; 6 + 1], [2; 12 + 1], [4; -12]);

% test our ransack function with data from homework
load("playpensample.mat");
%load("scan4.mat");
scan_data = [r .* cosd(theta), r .* sind(theta)];
scan_data = filter_by_row(scan_data, @(x) (x(1)));

figure(); hold on;
[fit_segs_start, fit_segs_end] = multisack(scan_data, 0.15, 0.15, 10000);

for seg=1:size(fit_segs_start,1)
    plot([fit_segs_start(seg,1), fit_segs_end(seg,1)],[fit_segs_start(seg,2), fit_segs_end(seg,2)], 'red');
end
exportgraphics(gcf,'scan4-out.png','Resolution',1500)

%plot_in = scatter(fit_inliers(:,1), fit_inliers(:,2), 'green');
%plot_out = scatter(fit_outliers(:,1), fit_outliers(:,2), 'red');
%plot_fit = plot([fit_seg_start(1), fit_seg_end(1)],[fit_seg_start(2), fit_seg_end(2)], 'black');
%legend([plot_in, plot_out, plot_fit], sprintf("inliers=%d",size(fit_inliers,1)),  sprintf("outliers=%d",size(fit_outliers,1)), "fit line");

