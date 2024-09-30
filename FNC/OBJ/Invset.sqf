/* ----------------------------------------------------------------------------
Function: persist_obj_fnc_invSet

Description:
    FILL ME

Parameters:
	FILL ME

Returns:
	FILL ME

Examples:
	FILL ME

Author:
    Tetlys
	Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_object", objNull, [objNull]],
    ["_inventory", [], [[]]]
];

clearWeaponCargoGlobal _object;
clearItemCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearBackpackCargoGlobal _object;

_inventory params [
    ["_magazines", [], [[]]],
    ["_weapons", [], [[]]],
    ["_items", [], [[]]],
    ["_everyContainer", [], [[]]]
];

{
    if (load _object > 1) exitWith {};
    _object addMagazineCargoGlobal [_x, (_magazines select 1) select _forEachIndex];
} forEach (_magazines select 0);

{
    if (load _object > 1) exitWith {};
    _object addWeaponWithAttachmentsCargoGlobal [_x, 1];
} forEach _weapons;

{
    if (load _object > 1) exitWith {};
    private _containerType = _x select 0;
    if (_containerType in _items) then {
        _object addItemCargoGlobal [_containerType, 1];
        _items deleteAt (_items find _containerType);
    } else {
        _object addBackpackCargoGlobal [_containerType, 1];
    };

    private _newContainer = everyContainer _object;
    [(_newContainer select (count _newContainer -1)) select 1, _x select 1] call persist_obj_fnc_invSet;
} forEach _everyContainer;

{
    if (load _object > 1) exitWith {};
    _object addItemCargoGlobal [_x, 1];
} forEach _items;
