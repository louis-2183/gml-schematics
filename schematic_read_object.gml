///schematic_read_object(txt,x,y)
/* 
    Reads and processes given object for a schematic

    Arguments:
    txt - Text from file
    
    x - Relative X
    
    y - Relative Y
    
    Returns:
    None
*/

var txt;
var splits;
var ox,oy;

txt = argument0
ox = argument1
oy = argument2

splits = string_split(txt)

switch (splits[0])
{
    case "object": 
        instance_create(ox+real(splits[2]),oy+real(splits[3]),real(splits[1])); 
    break;
}
 

