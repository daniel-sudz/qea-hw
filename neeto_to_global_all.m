% INPUT: 
% pos_x is position of neeto in x-axis of global frame
% pos_x is position of neeto in y-axis of global frame
% pos_angle is angle of neeto in global frame (reading counter-clockwise)
% sensor_d_all is the distance readings from the lidar sensor 
% sensor_a_all is the angle readings from the lidar sensor (reading
% counter-clockwise)
%
% RETURNS:
% gframe_x is the objects detected in the x-axis of global frame
% grame_y is the objects detected in the y-axis of global frame
function [gframe_xs, gframe_ys] = neeto_to_global_all(pos_x, pos_y, pos_angle, sensor_d_all, sensor_a_all)
   gframe_xs = []; 
   gframe_ys = []; 
   for i = 1:length(sensor_d_all)
       [x,y] = neeto_to_global(pos_x, pos_y, pos_angle, sensor_d_all(i), sensor_a_all(i));
       gframe_xs = [gframe_xs; x];
       gframe_ys= [gframe_ys; y];
   end
end
