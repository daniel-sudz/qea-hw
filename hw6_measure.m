close all; clear all;



[pos_x_1,  pos_y_1] =  to_xy(load("data/scan1.csv"));
[pos_x_2,  pos_y_2] =  to_xy(load("data/scan2.csv"));
[pos_x_3,  pos_y_3] =  to_xy(load("data/scan6.csv"));




figure(); hold on;
scatter(pos_x_1 - 0.86, pos_y_1 - 0.76);
scatter(pos_x_2 - 0.86, pos_y_2 - 0.76);

scatter(pos_x_3, pos_y_3);
