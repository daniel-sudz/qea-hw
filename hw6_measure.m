close all; clear all; 

% INIT the neato
%NEETO_IP = '192.168.16.121';
%[sensors,vels]=neato(NEETO_IP);
%pause(5); 
%vels.lrWheelVelocitiesInMetersPerSecond = [0; 0];

% collect data
%filename = "rotate_custom3";
%writematrix(sensors.thetasInRadians',append('data/hw6/', filename, '-angle.csv')); 
%writematrix(sensors.ranges',append('data/hw6/', filename, '-readings.csv')); 
%close all;

% plot data
figure(); hold on;
angle_origin = table2array(readtable('data/hw6/origin-angle.csv'));
distance_origin = table2array(readtable('data/hw6/origin-readings.csv'));
[pos_x, pos_y] = neeto_to_global_all(0, 0, 0, distance_origin, angle_origin); 
scatter(pos_x, pos_y);

angle_origin = table2array(readtable('data/hw6/rotate90-angle.csv'));
distance_origin = table2array(readtable('data/hw6/rotate90-readings.csv'));
[pos_x, pos_y] = neeto_to_global_all(0, 0, pi/2, distance_origin, angle_origin); 
scatter(pos_x, pos_y);

angle_origin = table2array(readtable('data/hw6/rotate_custom-angle.csv'));
distance_origin = table2array(readtable('data/hw6/rotate_custom-readings.csv'));
[pos_x, pos_y] = neeto_to_global_all(0.1778, 0.7, deg2rad(295), distance_origin, angle_origin); 
scatter(pos_x, pos_y);

angle_origin = table2array(readtable('data/hw6/rotate_custom2-angle.csv'));
distance_origin = table2array(readtable('data/hw6/rotate_custom2-readings.csv'));
[pos_x, pos_y] = neeto_to_global_all(-0.3302, -0.3302, (5/4) * pi, distance_origin, angle_origin); 
scatter(pos_x, pos_y);

%polarplot(angle_origin,distance_origin,'ks')

% 7 inches 
% 28.5 inches
% 65 degres 




