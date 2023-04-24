%#ok<*AGROW> 
function [pos_x, pos_y] = get_map()
    offsets = [
        -0.225, 0.9; % 1
        0.04, 1; % 2
        0.6, 0; % 3
        0.15, 0; % 4
        -0.2, 0; % 5
        -0.5, -0.025; % 6
         1.5, 1; % 7
        1.5, 0; % 8
        1.5, -0.8; % 9
        0.6, -0.8; % 10
        -0.15, -0.8; % 11
    ];
    
    pos_x = [];
    pos_y = []; 
    %plot_n = [];
    
    for i=1:size(offsets, 1)
        [x_, y_] = to_xy(load(append("data/scan", int2str(i), ".csv")), offsets(i,1), offsets(i,2));
        pos_x = [pos_x; x_]; 
        pos_y = [pos_y; y_];
        %plot_n = [plot_n scatter(x_, y_)];
    end
    %legend(plot_n, ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"])
end


%figure(); hold on;
%scatter(pos_x, pos_y);