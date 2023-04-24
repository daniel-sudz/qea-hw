%#ok<*AGROW> 
function [pos_x, pos_y] = get_map()
    offsets = [
        -0.2, 0.9;
        0, 1;
        0.6, 0;
        0.15, 0;
        -0.2, 0;
        -0.5, 0;
         1.5, 1;
        1.5, 0;
        1.5, -0.8;
        0.6, -0.8;
        -0.15, -0.8;
    ];
    
    pos_x = [];
    pos_y = []; 
    
    for i=1:size(offsets, 1)
        [x_, y_] = to_xy(load(append("data/scan", int2str(i), ".csv")), offsets(i,1), offsets(i,2));
        pos_x = [pos_x; x_]; 
        pos_y = [pos_y; y_];
    end
end


%figure(); hold on;
%scatter(pos_x, pos_y);