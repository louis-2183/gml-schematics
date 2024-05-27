///schematic_required_connector(connector)
/* 
    Fetches object index of required connector counterpart 

    Arguments:
    connector - Initial connector we want the counterpart for
    
    Returns:
    required - Counterpart
*/

var connector;
var required;

connector = argument0
required = "none"

switch (connector)
{
    case obj_sc_connector_left: required = obj_sc_connector_right; break;
    case obj_sc_connector_right: required = obj_sc_connector_left; break;
    case obj_sc_connector_up: required = obj_sc_connector_down; break;
    case obj_sc_connector_down: required = obj_sc_connector_up; break;
}

return required;
 
