///schematic_connector_offset(connector)
/* 
    Fetches offset used to bridge gap between existing and placed rooms

    Arguments:
    connector - Connector expanded from
    
    Returns:
    offset - X and Y coords to offset by
*/

var connector;
var offset;

connector = argument0
offset[0] = 0
offset[1] = 0

switch (connector)
{
    case obj_sc_connector_left: offset[0] = 16; break;
    case obj_sc_connector_right: offset[0] = -16; break;
    case obj_sc_connector_up: offset[1] = 16; break;
    case obj_sc_connector_down: offset[1] = -16; break;
}

return offset;
 
