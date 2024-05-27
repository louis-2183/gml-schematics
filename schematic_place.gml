///schematic_place(name,x,y)
/* 
    Schematic placement script

    Arguments:
    name - Name for target room 
    
    x - Room anchor X
    
    y - Room anchor Y
    
    Returns:
    None
*/

var file;
var splits;
var name;
var ox,oy;
var inst;
var scr;
var scanning = false

name = argument0
ox = argument1
oy = argument2

file = file_text_open_read(working_directory + "save.txt");

// Loop through datafile
while (!file_text_eof(file))
{
    // Get current line
    scr = file_text_read_string(file);
    file_text_readln(file)
    
    splits = string_split(scr)
    
    // If we are scanning and on an object, place it
    if scanning == true {
        schematic_read_object(scr,ox,oy)
    }
    
    // We found the room we want to add
    if splits[0] == "rm" && splits[1] == name {
        scanning = true
    }
    else if splits[0] == "rm" && scanning == true {
        scanning = false
        break;
    }
}

// Free memory from split array
splits = 0

file_text_close(file);

