/// @description Create grid
cell_width = 16
cell_height = 16

hcells = room_width div cell_width
vcells = room_height div cell_height

global.grid = mp_grid_create(0,0,hcells,vcells,cell_width,cell_height)

mp_grid_add_instances(global.grid,obj_ground,false)