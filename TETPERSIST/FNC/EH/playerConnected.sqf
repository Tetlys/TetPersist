/* ----------------------------------------------------------------------------
Function: persist_eh_fnc_PlayerConnected

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

---------------------------------------------------------------------------- */

params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

if (_name isEqualTo "__SERVER__") exitWith {};

// Connected
[{
    !isNull ((_this select 1) call BIS_fnc_getUnitByUID)
}, {
    ["tet_playerConnected", [(_this select 1) call BIS_fnc_getUnitByUID, _this]] call CBA_fnc_localEvent;
}, _this, 20 * 60] call CBA_fnc_waitUntilAndExecute;