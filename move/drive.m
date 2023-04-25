clear all; close all;

[sensors,vels]= neatoSim(-2, 0, pi/2, 1); % create the simulator
pause(15); % give the simulator a few seconds to load


points = [
    0 0;
    0.1895   -0.0641;
    0.3778   -0.1313;
    0.5716   -0.1808;
    0.7700   -0.2062;
    0.9604   -0.2673;
    1.1593   -0.2461;
    ];
%move_many(points, sensors, vels);
