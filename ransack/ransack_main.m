clear all; close all;

% test our ransack function with data from homework
load("playpensample.mat");
state = SackState.FromPolar(r, theta);
state.sack_multi();
