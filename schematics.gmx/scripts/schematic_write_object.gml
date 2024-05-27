///schematic_write_object()
/* 
    Writes a given object to schematics file

    Arguments:
    None
    
    Returns:
    txt - Details to add to file
*/

var txt;
txt = "";

switch (object_index)
{
    default: 
        txt = "object_"+string(object_index)+"_"+string(x)+"_"+string(y);
}

return txt;
