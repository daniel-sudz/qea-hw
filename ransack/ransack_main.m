clear all; close all;

[map_x, map_y] = get_map();
state = SackState.FromGlobal(map_x, map_y);
state.sack_multi();
