/////////////////////SERVER\\\\\\\\\\\\\\\\\\\\\


// 		DATABASE
persist_db_fnc_save = compileScript ["TETPERSIST\FNC\CORE\save.sqf"];
persist_db_fnc_load = compileScript ["TETPERSIST\FNC\CORE\load.sqf"];
persist_db_fnc_delete = compileScript ["TETPERSIST\FNC\CORE\delete.sqf"];
persist_db_fnc_LoadObjStatus = compileScript ["TETPERSIST\FNC\CORE\loadobjectstatus.sqf"];
persist_db_fnc_SaveObjStatus = compileScript ["TETPERSIST\FNC\CORE\saveobjectstatus.sqf"];
persist_db_fnc_LoadCargo = compileScript ["TETPERSIST\FNC\CORE\loadcargo.sqf"];
persist_db_fnc_setTurretMagazines = compileScript ["TETPERSIST\FNC\CORE\setturretMagazines.sqf"];

// 		EH
persist_eh_fnc_server = compileScript ["TETPERSIST\FNC\EH\server.sqf"];
persist_eh_fnc_PlayerConnected = compileScript ["TETPERSIST\FNC\EH\playerConnected.sqf"];

// 		SLOTS
persist_slot_fnc_serialize = compileScript ["TETPERSIST\FNC\SLOT\serializestate.sqf"];
persist_slot_fnc_Deserialize_S = compileScript ["TETPERSIST\FNC\SLOT\deserializestate_s.sqf"];
persist_slot_fnc_CreateKey = compileScript ["TETPERSIST\FNC\SLOT\CreateKey.sqf"];

// 		OBJECT 
persist_obj_fnc_init = compileScript ["TETPERSIST\FNC\OBJ\init.sqf"];

// 		VEH 
persist_veh_fnc_propertiesGet = compileScript ["TETPERSIST\FNC\VEH\propertiesget.sqf"];
persist_veh_fnc_propertiesSet = compileScript ["TETPERSIST\FNC\VEH\propertiesset.sqf"];
persist_veh_fnc_add = compileScript ["TETPERSIST\FNC\VEH\add.sqf"];


/////////////////////CLIENT\\\\\\\\\\\\\\\\\\\\\

// 		EH 
persist_eh_fnc_ObjectPlaced = compileScript ["TETPERSIST\FNC\EH\CuratorObjectPlaced.sqf"];
persist_eh_fnc_Player = compileScript ["TETPERSIST\FNC\EH\player.sqf"];

//		 UI
persist_ui_fnc_actions = compileScript ["TETPERSIST\FNC\UI\addactions.sqf"];
persist_ui_fnc_keys = compileScript ["TETPERSIST\FNC\UI\keys.sqf"];

// 		SLOT 
persist_slot_fnc_Deserialize = compileScript ["TETPERSIST\FNC\SLOT\DeserializeState.sqf"];


/////////////////////CLIENT AND SERVER\\\\\\\\\\\\\\\\\\\\\

//  	OBJECT 
persist_obj_fnc_invSet = compileScript ["TETPERSIST\FNC\OBJ\InvSet.sqf"];
persist_obj_fnc_invGet = compileScript ["TETPERSIST\FNC\OBJ\InvGet.sqf"];


// 		VEH 
persist_veh_fnc_init = compileScript ["TETPERSIST\FNC\VEH\init.sqf"];

//		 UI  
persist_ui_fnc_open = compileScript ["TETPERSIST\FNC\UI\open.sqf"];
