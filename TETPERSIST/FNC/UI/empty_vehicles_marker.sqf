private [ "_vehmarkers", "_markedveh", "_cfg", "_vehtomark", "_marker" ];

_vehmarkers = [];
_markedveh = []; 
_markedveh1 = [];
_cfg = configFile >> "cfgVehicles";

// Misc variables
markers_reset = [99999,99999,0];

while { true } do {

_markedveh = [];
{
    // Fetch vehicle's faction and type
    _vehicleFaction = faction _x;
    _vehicleType = typeOf _x;

    // Get the side from the vehicle's configuration
    _vehicleSide = getNumber(configFile >> "CfgVehicles" >> _vehicleType >> "side");

    // Check if the vehicle belongs to Bluefor (side 1), is alive, and has no crew
    if (_vehicleSide == 1) then { // 1 corresponds to WEST (Bluefor)
        if (alive _x) then {
            if (count (crew _x) == 0) then {
                // Add vehicle to the marked array
                _markedveh pushBack _x;
            };
        };
    };
} foreach vehicles;

    if ( count _markedveh != count _vehmarkers ) then {
        { deleteMarkerLocal _x; } foreach _vehmarkers;
        _vehmarkers = [];

        {
            _marker = createMarkerLocal [ format [ "markedveh%1" ,_x], markers_reset ];
            _marker setMarkerColorLocal "ColorKhaki";
            _marker setMarkerTypeLocal "mil_dot";
            _marker setMarkerSizeLocal [ 0.75, 0.75 ];
            _vehmarkers pushback _marker;

        } foreach _markedveh;
    };

    {
        _marker = _vehmarkers select (_markedveh find _x);
        _marker setMarkerPosLocal getpos _x;
        _marker setMarkerTextLocal  (getText (_cfg >> typeOf _x >> "displayName"));

    } foreach _markedveh;

    sleep 15;
};