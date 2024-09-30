/* ----------------------------------------------------------------------------
Function: persist_veh_fnc_propertiesGet

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
    ["_vehicle", objNull, [objNull]]
];

private _customization = _vehicle call BIS_fnc_getVehicleCustomization;
private _isMedicalVehicle = _vehicle call ace_medical_treatment_fnc_isMedicalVehicle;
private _isRepairVehicle = _vehicle call ace_repair_fnc_isRepairVehicle;
private _fuelSource = [
    _vehicle call ace_refuel_fnc_getFuel,
    _vehicle getVariable ["ace_refuel_hooks", []],
    _vehicle getVariable ["TET_EDEN_defaultFuelCargo", _vehicle call ace_refuel_fnc_getFuel]
];
private _pylons = getPylonMagazines _vehicle;
private _supplyVehicle = [
    _vehicle call ace_rearm_fnc_isSource,
    _vehicle call ace_rearm_fnc_getSupplyCount,
    _vehicle getVariable ["TET_EDEN_defaultSupply", _vehicle call ace_rearm_fnc_getSupplyCount]
];

private _objectTexture = [];
if (_customization select 0 isEqualTo []) then {
    _objectTexture = getObjectTextures _vehicle;
};

[_customization, _isMedicalVehicle, _isRepairVehicle, _fuelSource, _pylons, _supplyVehicle, _objectTexture]
