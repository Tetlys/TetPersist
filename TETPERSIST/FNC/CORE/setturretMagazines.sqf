/* ----------------------------------------------------------------------------
Function: persist_db_fnc_setTurretMagazines

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

params [
    ["_vehicle", objNull, [objNull]],
    ["_turretMagazines", [], [[]]]
];

if (_turretMagazines isEqualTo []) exitWith {};

{
    _x params ["_magazineClass", "_turretPath"];
    _vehicle removeMagazineTurret [_magazineClass, _turretPath];
    false
} forEach (magazinesAllTurrets _vehicle);
{
    _x params ["_magazineClass", "_turretPath", "_ammoCount"];
    _vehicle addMagazineTurret [_magazineClass, _turretPath, _ammoCount];
} forEach _turretMagazines;