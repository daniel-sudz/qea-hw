clear all; close all;

% verified point and line projection with some test point: 
% https://www.wolframalpha.com/input?i=distance+between+line+y%3D2x*3+%2B+1+and+%284%2C-12%29
project_point([1; 6 + 1], [2; 12 + 1], [4; -12]);

% test our ransack function with data from homework
load("playpensample.mat");
state = SackState.FromPolar(r, theta);

figure(); hold on; axis equal;
state.sack_multi();