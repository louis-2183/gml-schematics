///schematic_harvest()
/* 
    Schematic harvesting script

    Arguments:
    None
    
    Returns:
    None
*/

var file;
var connector_name;

// If room we are in is a schematic
if(string_copy(room_get_name(room),0,3) == "sc_") { 

    roomname = string_copy(room_get_name(room),4,string_length(room_get_name(room)))  
    file = file_text_open_append(working_directory + "save.txt");

    /*************** ROOM VARIABLES ***************/

    // Room name, Size X, Size Y
    file_text_write_string(file, "rm_"+roomname+"_"+string(room_width)+"_"+string(room_height));
    file_text_writeln(file);
    
    /*************** OBJECT POSITIONS ***************/
    
    with(all) {
        if (id != other.id) {
            file_text_write_string(file,schematic_write_object(object_index));  
            file_text_writeln(file);                  
        }
    }
    
    // Go to next room, repeating process for all schematics
    file_text_close(file);
    room_goto_next()
} 
else { 
   // If we have reached the actual map, there is no need for schematic harvesting
   instance_destroy()
}


