//Arma 3 - Safezone Script - Edit by tanZ
//Steam: http://steamcommunity.com/id/sonoyunbukucutv
//Website: http://wwww.youtube.com/sonoyunbukucutv

#define SAFETY_ZONES    [["respawn_west", 250],["RESPAWN_Guer",20],["respawn-east",15]] // Örnek: [["marker1", radius1], ["marker2", radius2], ...]
#define MESSAGE "Basede Ateş Etmek Yasaktır.Lütfen Daha Fazla Zorlama!"

if (isDedicated) exitWith {};
waitUntil {!isNull player};

player addEventHandler ["Fired", {
   if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
   {
       deleteVehicle (_this select 6);
       titleText [MESSAGE, "PLAIN", 3];
   };
}];
