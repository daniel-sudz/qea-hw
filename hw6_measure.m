close all; clear all;



[pos_x_1,  pos_y_1] =  to_xy(load("data/scan1.csv"));
[pos_x_2,  pos_y_2] =  to_xy(load("data/scan2.csv"));
[pos_x_3,  pos_y_3] =  to_xy(load("data/scan3.csv"));
[pos_x_4,  pos_y_4] =  to_xy(load("data/scan4.csv"));
[pos_x_5,  pos_y_5] =  to_xy(load("data/scan5.csv"));
[pos_x_6,  pos_y_6] =  to_xy(load("data/scan6.csv"));
[pos_x_7,  pos_y_7] =  to_xy(load("data/scan7.csv"));
[pos_x_8,  pos_y_8] =  to_xy(load("data/scan8.csv"));
[pos_x_9,  pos_y_9] =  to_xy(load("data/scan9.csv"));
[pos_x_10, pos_y_10] = to_xy(load("data/scan10.csv"));
[pos_x_11, pos_y_11] = to_xy(load("data/scan11.csv"));



figure(); hold on;
plot1 = scatter(pos_x_1 + 0.2, pos_y_1 - 0.9);
plot2 = scatter(pos_x_2, pos_y_2 - 1);
plot3 = scatter(pos_x_3 - 0.6, pos_y_3);
plot4 = scatter(pos_x_4 - 0.15, pos_y_4);
plot5 = scatter(pos_x_5 + 0.2, pos_y_5);
plot6 =  scatter(pos_x_6 + 0.5, pos_y_6);
plot7 =  scatter(pos_x_7 - 1.5, pos_y_7 - 1);
plot8 =  scatter(pos_x_8 - 1.5, pos_y_8);
plot9 =  scatter(pos_x_9 - 1.5, pos_y_9 + 0.8);
plot10 =  scatter(pos_x_10 - 0.6, pos_y_10 + 0.8);
plot11 =  scatter(pos_x_11 + 0.15, pos_y_11 + 0.8);

legend([plot1, plot2, plot3, plot4, plot5, plot6, plot7, plot8, plot9, plot10, plot11], ["plot1", "plot2", "plot3", "plot4", "plot5", "plot6", "plot7", "plot8", "plot9", "plot10", "plot11"]);