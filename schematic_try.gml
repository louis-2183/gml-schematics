///schematic_try(x,y,required)

/* 
    Picks a schematic out of bag to place if conditions are met

    Arguments:
    x - Room anchor X
    
    y - Room anchor Y
    
    required - Required connector counterpart which the room must have to connect
    
    Returns:
    None
*/
var file;
var ox,oy;
var tx,ty;
var required;
var scr;
var size_x,size_y;
var roomname;
var scanning = false;
var possible_structs = ds_list_create()
var structure;
var chosen;
var shift;

shift = TILE_SIZE/2
ox = argument0
oy = argument1
required = argument2
roomname = "none"

file = file_text_open_read(working_directory + "save.txt");

// Loop through datafile
while (!file_text_eof(file))
{
    // Get current line
    scr = file_text_read_string(file);
    file_text_readln(file)
    
    splits = string_split(scr)
    
    if splits[0] == "rm" && scanning == false {
        roomname = splits[1]
        size_x = real(splits[2])
        size_y = real(splits[3])        
        scanning = true    
    }
    if scanning == true && splits[0] == "object" {
        if real(splits[1]) == required {
            tx = ox-real(splits[2])
            ty = oy-real(splits[3])
            
            if !collision_rectangle(tx+shift,ty+shift,tx+size_x-shift,ty+size_y-shift,obj_sc_ground,false,true) {                    
                structure[0] = roomname
                structure[1] = tx
                structure[2] = ty
                ds_list_add(possible_structs,structure)
            }
        }
    }
}

// Free memory from split array
splits = 0

file_text_close(file);

ds_list_shuffle(possible_structs)

if ds_list_size(possible_structs) > 0 {
    chosen = ds_list_find_value(possible_structs,0)    
}
else {
    chosen = -1
}

ds_list_destroy(possible_structs)

return chosen;
