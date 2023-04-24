function [gframe_x, gframe_y] = to_xy(sensor_d)
    angle_matrix = table2array(readtable('data/hw6/origin-angle.csv'));
    
    data = [cos(angle_matrix) .* sensor_d', sin(angle_matrix) .* sensor_d'];
    data  = filter_by_row(data, @(x)(x(1) && x(2)));

    gframe_x = data(:,1);
    gframe_y = data(:,2);
end
