///schematic_update()
/* 
    Appends a new schematic to dungeon

    Arguments:
    None
    
    Returns:
    None
*/

var possible_connectors = ds_list_create()
var connector = -1
var chosen;
var offset;

with(obj_sc_connector) {
    if active == true {
        ds_list_add(possible_connectors,id)
        active = false
    }
}

ds_list_shuffle(possible_connectors)

for(var i=0;i<ds_list_size(possible_connectors);i++) {
    connector = ds_list_find_value(possible_connectors,i)
    
    chosen = schematic_try(connector.x,connector.y,schematic_required_connector(connector.object_index))
    
    if chosen != -1 {
        offset = schematic_connector_offset(connector.object_index)
    
        schematic_place(chosen[0],chosen[1]+offset[0],chosen[2]+offset[1])
        break;
    }
}

ds_list_destroy(possible_connectors)
