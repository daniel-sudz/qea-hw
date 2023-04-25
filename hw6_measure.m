close all; clear all;
angle_matrix = transpose(table2array(readtable('data/hw6/origin-angle.csv')));


% [pos_x_1,  pos_y_1] =  to_xy(load("data/scan1.csv"));
% [pos_x_2,  pos_y_2] =  to_xy(load("data/scan2.csv"));
% [pos_x_4,  pos_y_4] =  to_xy(load("data/scan4.csv"));
% [pos_x_5,  pos_y_5] =  to_xy(load("data/scan5.csv"));
% [pos_x_6,  pos_y_6] =  to_xy(load("data/scan6.csv"));
% [pos_x_7,  pos_y_7] =  to_xy(load("data/scan7.csv"));
% [pos_x_8,  pos_y_8] =  to_xy(load("data/scan8.csv"));
% [pos_x_9,  pos_y_9] =  to_xy(load("data/scan9.csv"));
% [pos_x_10, pos_y_10] = to_xy(load("data/scan10.csv"));
% [pos_x_11, pos_y_11] = to_xy(load("data/scan11.csv"));
[pos_x_origin, pos_y_origin] = neeto_to_global(0, 0, 0, load("data/scan_origin.csv"), angle_matrix);
[pos_x_1, pos_y_1] = neeto_to_global(-0.83, 0.80, 2.5*pi()/180, load("data/scan1.csv"), angle_matrix);
[pos_x_2, pos_y_2] = neeto_to_global(-0.6, 0.87, 2.5*pi()/180, load("data/scan2.csv"), angle_matrix);
% 3 is skipped becuase thats the origin
[pos_x_4, pos_y_4] = neeto_to_global(-0.385, -0.05, 1*pi()/180, load("data/scan4.csv"), angle_matrix);
[pos_x_5, pos_y_5] = neeto_to_global(-0.793, -0.07, 1*pi()/180, load("data/scan5.csv"), angle_matrix);
[pos_x_6, pos_y_6] = neeto_to_global(-1.07, -0.07, 1*pi()/180, load("data/scan6.csv"), angle_matrix);
[pos_x_7, pos_y_7] = neeto_to_global(0.91, 0.95, 2*pi()/180, load("data/scan7.csv"), angle_matrix);
[pos_x_8, pos_y_8] = neeto_to_global(0.96, 0, 1*pi()/180, load("data/scan8.csv"), angle_matrix);
[pos_x_9, pos_y_9] = neeto_to_global(0.98, -0.75, 1*pi()/180, load("data/scan9.csv"), angle_matrix);
[pos_x_10, pos_y_10] = neeto_to_global(0, -0.79, 1*pi()/180, load("data/scan10.csv"), angle_matrix);
[pos_x_11, pos_y_11] = neeto_to_global(-0.71, -0.83, 1*pi()/180, load("data/scan11.csv"), angle_matrix);
[pos_x_12, pos_y_12] = neeto_to_global(-1.13, 0.76, 162*pi()/180, load("data/scan12.csv"), angle_matrix);
[pos_x_13, pos_y_13] = neeto_to_global(-0.74, 0.83, 97.5*pi()/180, load("data/scan13.csv"), angle_matrix);

figure(); hold on;
% plot1 = scatter(pos_x_1 + 0.2, pos_y_1 - 0.9);
% plot2 = scatter(pos_x_2, pos_y_2 - 1);
% plot3 = scatter(pos_x_3 - 0.6, pos_y_3);
% plot4 = scatter(pos_x_4 - 0.15, pos_y_4);
% plot5 = scatter(pos_x_5 + 0.2, pos_y_5);
% plot6 =  scatter(pos_x_6 + 0.5, pos_y_6);
% plot7 =  scatter(pos_x_7 - 1.5, pos_y_7 - 1);
% plot8 =  scatter(pos_x_8 - 1.5, pos_y_8);
% plot9 =  scatter(pos_x_9 - 1.5, pos_y_9 + 0.8);
% plot10 =  scatter(pos_x_10 - 0.6, pos_y_10 + 0.8);
% plot11 =  scatter(pos_x_11 + 0.15, pos_y_11 + 0.8);
% plot12 =  scatter(pos_x_12, pos_y_12, "black");
plotorigin = scatter(pos_x_origin, pos_y_origin);
plot1 = scatter(pos_x_1, pos_y_1);
plot2 = scatter(pos_x_2, pos_y_2);
plot4 = scatter(pos_x_4, pos_y_4);
plot5 = scatter(pos_x_5, pos_y_5);
plot6 = scatter(pos_x_6, pos_y_6);
plot7 = scatter(pos_x_7, pos_y_7);
plot8 = scatter(pos_x_8, pos_y_8);
plot9 = scatter(pos_x_9, pos_y_9);
plot10 = scatter(pos_x_10, pos_y_10);
plot11 = scatter(pos_x_11, pos_y_11);
plot12 = scatter(pos_x_12, pos_y_12);
plot13 = scatter(pos_x_13, pos_y_13);

legend([plotorigin, plot1, plot2, plot4, plot5, plot6, plot7, plot8, plot9, plot10, plot11, plot12, plot13], ["plotorigin", "plot1", "plot2", "plot4", "plot5", "plot6", "plot7", "plot8", "plot9", "plot10", "plot11", "plot12", "plot13"]);