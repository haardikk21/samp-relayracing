/*
	SA-MP Relay Racing Gamemode
	Created by Hardik Kumar
	Representing DomainSquare+ for EXUN 2015
    Github: hardikk21
*/

#include <a_samp>
#include <izcmd>

#define CHECK_SIZE 12
#define Team_One 1
#define Team_Two 2
#define Team_Three 3
#define Team_Four 4
#define Team_One_2 5
#define Team_Two_2 6
#define Team_Three_2 7
#define Team_Four_2 8

#define TotalChecks 15

new bool:racestarted = false;
new gTeam[MAX_PLAYERS];
new gPlayerProgress[MAX_PLAYERS];
new Float:RaceCheckpoints[TotalChecks][3];
new oneid,one2id,twoid,two2id,threeid,three2id,fourid,four2id;
new first,second,third,fourth = 999;
main()
{
}

CMD:beginrace(playerid, params[])
{
	if(IsPlayerAdmin(playerid))
	{
		racestarted = true;
  for(new i=0; i<= 8; i++)
  {
    if(gTeam[i] == Team_One || gTeam[i] == Team_Two || gTeam[i] == Team_Three || gTeam[i] == Team_Four)
    {
		TogglePlayerControllable(i, 1);
	}
	}
		
		SetPlayerRaceCheckpoint(oneid, 0, RaceCheckpoints[gPlayerProgress[oneid]][0], RaceCheckpoints[gPlayerProgress[oneid]][1], RaceCheckpoints[gPlayerProgress[oneid]][2], 0.0, 0.0, 0.0, CHECK_SIZE);
        SetPlayerRaceCheckpoint(twoid, 0, RaceCheckpoints[gPlayerProgress[twoid]][0], RaceCheckpoints[gPlayerProgress[twoid]][1], RaceCheckpoints[gPlayerProgress[twoid]][2], 0.0, 0.0, 0.0, CHECK_SIZE);
        SetPlayerRaceCheckpoint(threeid, 0, RaceCheckpoints[gPlayerProgress[threeid]][0], RaceCheckpoints[gPlayerProgress[threeid]][1], RaceCheckpoints[gPlayerProgress[threeid]][2], 0.0, 0.0, 0.0, CHECK_SIZE);
        SetPlayerRaceCheckpoint(fourid, 0, RaceCheckpoints[gPlayerProgress[fourid]][0], RaceCheckpoints[gPlayerProgress[fourid]][1], RaceCheckpoints[gPlayerProgress[fourid]][2], 0.0, 0.0, 0.0, CHECK_SIZE);
	}
	return 1;
}
public OnGameModeInit()
{
	SetGameModeText("DomainSquare+ Racing");
	AddPlayerClass(170,1522.2528,-887.0850,61.1224,248.4600,0,0,0,0,0,0); //
	AddPlayerClass(299,1522.2528,-887.0850,61.1224,248.4600,0,0,0,0,0,0); //
	AddPlayerClass(157,1522.2528,-887.0850,61.1224,248.4600,0,0,0,0,0,0); //
	AddPlayerClass(202,1522.2528,-887.0850,61.1224,248.4600,0,0,0,0,0,0); //
	AddPlayerClass(60,1522.2528,-887.0850,61.1224,248.4600,0,0,0,0,0,0); //
	AddPlayerClass(59,1522.2528,-887.0850,61.1224,248.4600,0,0,0,0,0,0); //
	AddPlayerClass(55,1522.2528,-887.0850,61.1224,248.4600,0,0,0,0,0,0); //
	AddPlayerClass(285,1522.2528,-887.0850,61.1224,248.4600,0,0,0,0,0,0); //

    //Checkpoint 1
	RaceCheckpoints[0][0] = 1699.6575;
	RaceCheckpoints[0][1] = -1812.2810;
	RaceCheckpoints[0][2] = 13.4624;
	//Checkpoint 2
	RaceCheckpoints[1][0] = 1693.3346;
	RaceCheckpoints[1][1] = -1896.0123;
	RaceCheckpoints[1][2] = 13.6391;
	//Checkpoint 3
	RaceCheckpoints[2][0] = 1697.0066;
	RaceCheckpoints[2][1] = -1939.9933;
	RaceCheckpoints[2][2] = 13.6462;
	//Checkpoint 4
	RaceCheckpoints[3][0] = 1784.2354;
	RaceCheckpoints[3][1] = -1945.2357;
	RaceCheckpoints[3][2] = 13.6426;
	//Checkpoint 5
	RaceCheckpoints[4][0] = 1942.3971;
	RaceCheckpoints[4][1] = -1957.5251;
	RaceCheckpoints[4][2] = 13.6387;
	//Checkpoint 6
	RaceCheckpoints[5][0] = 1962.3987;
	RaceCheckpoints[5][1] = -1904.1699;
	RaceCheckpoints[5][2] = 13.4752;
	//Checkpoint 7
	RaceCheckpoints[6][0] = 1972.4584;
	RaceCheckpoints[6][1] = -1887.4623;
	RaceCheckpoints[6][2] = 13.6392;
	//Checkpoint 8
	RaceCheckpoints[7][0] = 2013.7773;
	RaceCheckpoints[7][1] = -1925.5957;
	RaceCheckpoints[7][2] = 13.6392;
	//Checkpoint 9
	RaceCheckpoints[8][0] = 2082.4888;
	RaceCheckpoints[8][1] = -1912.3934;
	RaceCheckpoints[8][2] = 13.4755;
	//Checkpoint 10
	RaceCheckpoints[9][0] = 2087.6006;
	RaceCheckpoints[9][1] = -1760.9492;
	RaceCheckpoints[9][2] = 13.4954;
	//Checkpoint 11
	RaceCheckpoints[10][0] = 1949.2087;
	RaceCheckpoints[10][1] = -1749.2487;
	RaceCheckpoints[10][2] = 13.4752;
	//Checkpoint 12
	RaceCheckpoints[11][0] = 1929.5579;
	RaceCheckpoints[11][1] = -1678.6388;
	RaceCheckpoints[11][2] = 13.6393;
	//Checkpoint 13
	RaceCheckpoints[12][0] = 1892.4060;
	RaceCheckpoints[12][1] = -1615.3596;
	RaceCheckpoints[12][2] = 13.4752;
	//Checkpoint 14
	RaceCheckpoints[13][0] = 1828.2029;
	RaceCheckpoints[13][1] = -1617.0608;
	RaceCheckpoints[13][2] = 13.4773;
	//Checkpoint 15
	RaceCheckpoints[14][0] = 1823.0636;
	RaceCheckpoints[14][1] = -1817.7719;
	RaceCheckpoints[14][2] = 13.5020;

	//Car Locations
	AddStaticVehicle(562, 1801.8547, -1829.2113, 13.1690, 87.7014, 0, 0);
	AddStaticVehicle(562, 1801.7611, -1831.6292, 13.1738, 88.1390, 0, 0);
	AddStaticVehicle(562, 1801.8485, -1833.9850, 13.1130, 88.7647, 0, 0);
	AddStaticVehicle(562, 1801.6915, -1836.1945, 13.4790, 88.9332, 0, 0);
	
	AddStaticVehicle(411,1807.2445,-1829.3024,13.0501,89.1841,0,0); // car pos_2 4
	AddStaticVehicle(411,1807.2295,-1831.6409,13.0494,88.8101,0,0); // car pos_2 3
	AddStaticVehicle(411,1807.2872,-1833.9814,13.0441,88.2711,0,0); // pos_2 2
	AddStaticVehicle(411,1807.2732,-1836.2916,13.0418,88.9322,0,0); // car pos _2 1
	return 1;
}

public OnGameModeExit()
{
	return 1;
}
forward SetPlayerTeamFromClass(playerid, classid);
public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerTeamFromClass(playerid, classid);
	return 1;
}

public SetPlayerTeamFromClass(playerid, classid)
{
	if(classid == 0)
	{
	    gTeam[playerid] = Team_One;
	    GameTextForPlayer(playerid, "Team One (Player 1)", 3000, 6);
	    SetPlayerPos(playerid,1975.2399,-1220.0157,25.0779); // position of the player in the class selection
		SetPlayerCameraPos(playerid,1969.5686,-1224.0016,24.9909); // Cameraposition
		SetPlayerCameraLookAt(playerid,1975.2399,-1220.0157,25.0779);
		SetPlayerFacingAngle(playerid,122.4500);

	}
	else if(classid == 1)
	{
	    gTeam[playerid] = Team_Two;
	    GameTextForPlayer(playerid, "Team Two (Player 1)", 3000, 6);
	    SetPlayerPos(playerid,1975.2399,-1220.0157,25.0779); // position of the player in the class selection
		SetPlayerCameraPos(playerid,1969.5686,-1224.0016,24.9909); // Cameraposition
		SetPlayerCameraLookAt(playerid,1975.2399,-1220.0157,25.0779);
		SetPlayerFacingAngle(playerid,122.4500);

	}
	else if(classid == 2)
	{
	    gTeam[playerid] = Team_Three;
	    GameTextForPlayer(playerid, "Team Three (Player 1)", 3000, 6);
	    SetPlayerPos(playerid,1975.2399,-1220.0157,25.0779); // position of the player in the class selection
		SetPlayerCameraPos(playerid,1969.5686,-1224.0016,24.9909); // Cameraposition
		SetPlayerCameraLookAt(playerid,1975.2399,-1220.0157,25.0779);
		SetPlayerFacingAngle(playerid,122.4500);

	}
	else if(classid == 3)
	{
	    gTeam[playerid] = Team_Four;
	    GameTextForPlayer(playerid, "Team Four (Player 1)", 3000, 6);
	    SetPlayerPos(playerid,1975.2399,-1220.0157,25.0779); // position of the player in the class selection
		SetPlayerCameraPos(playerid,1969.5686,-1224.0016,24.9909); // Cameraposition
		SetPlayerCameraLookAt(playerid,1975.2399,-1220.0157,25.0779);
		SetPlayerFacingAngle(playerid,122.4500);

	}
	else if(classid == 4)
	{
	    gTeam[playerid] = Team_One_2;
	    GameTextForPlayer(playerid, "Team One (Player 2)", 3000, 6);
	    SetPlayerPos(playerid,1975.2399,-1220.0157,25.0779); // position of the player in the class selection
		SetPlayerCameraPos(playerid,1969.5686,-1224.0016,24.9909); // Cameraposition
		SetPlayerCameraLookAt(playerid,1975.2399,-1220.0157,25.0779);
		SetPlayerFacingAngle(playerid,122.4500);

	}
	else if(classid == 5)
	{
	    gTeam[playerid] = Team_Two_2;
	    GameTextForPlayer(playerid, "Team Two (Player 2)", 3000, 6);
	    SetPlayerPos(playerid,1975.2399,-1220.0157,25.0779); // position of the player in the class selection
		SetPlayerCameraPos(playerid,1969.5686,-1224.0016,24.9909); // Cameraposition
		SetPlayerCameraLookAt(playerid,1975.2399,-1220.0157,25.0779);
		SetPlayerFacingAngle(playerid,122.4500);

	}
	else if(classid == 6)
	{
	    gTeam[playerid] = Team_Three_2;
	    GameTextForPlayer(playerid, "Team Three (Player 2)", 3000, 6);
	    SetPlayerPos(playerid,1975.2399,-1220.0157,25.0779); // position of the player in the class selection
		SetPlayerCameraPos(playerid,1969.5686,-1224.0016,24.9909); // Cameraposition
		SetPlayerCameraLookAt(playerid,1975.2399,-1220.0157,25.0779);
		SetPlayerFacingAngle(playerid,122.4500);

	}
	else if(classid == 7)
	{
	    gTeam[playerid] = Team_Four_2;
	    GameTextForPlayer(playerid, "Team Four (Player 2)", 3000, 6);
	    SetPlayerPos(playerid,1975.2399,-1220.0157,25.0779); // position of the player in the class selection
		SetPlayerCameraPos(playerid,1969.5686,-1224.0016,24.9909); // Cameraposition
		SetPlayerCameraLookAt(playerid,1975.2399,-1220.0157,25.0779);
		SetPlayerFacingAngle(playerid,122.4500);

	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{

	if(gTeam[playerid] == Team_One) { oneid=playerid; PutPlayerInVehicle(playerid, 1, 0); }
	else if(gTeam[playerid] == Team_Two) { twoid=playerid;PutPlayerInVehicle(playerid, 2, 0); }
	else if(gTeam[playerid] == Team_Three) { threeid=playerid;PutPlayerInVehicle(playerid, 3, 0); }
	else if(gTeam[playerid] == Team_Four) { fourid=playerid;PutPlayerInVehicle(playerid, 4, 0); }
	else if(gTeam[playerid] == Team_One_2) { one2id=playerid;PutPlayerInVehicle(playerid, 5, 0); }
	else if(gTeam[playerid] == Team_Two_2) { two2id=playerid;PutPlayerInVehicle(playerid, 6, 0); }
	else if(gTeam[playerid] == Team_Three_2) { three2id=playerid;PutPlayerInVehicle(playerid, 7, 0); }
	else if(gTeam[playerid] == Team_Four_2) { four2id=playerid;PutPlayerInVehicle(playerid, 8, 0); }
	TogglePlayerControllable(playerid, 0);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{

	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}
forward PlaySoundForPlayer(playerid, soundid);
forward RaceWinners();
public OnPlayerEnterRaceCheckpoint(playerid)
{
	gPlayerProgress[playerid]++;
	if(gPlayerProgress[playerid] == 15)
	{
	    
	    if(playerid == oneid) { new vehicleid = GetPlayerVehicleID(playerid);  RemovePlayerFromVehicle(playerid); DestroyVehicle(vehicleid);TogglePlayerControllable(playerid, 0); GameTextForPlayer(playerid, "You finished.", 1000, 6); TogglePlayerControllable(one2id, 1); SetPlayerRaceCheckpoint(one2id, 0, RaceCheckpoints[gPlayerProgress[one2id]][0], RaceCheckpoints[gPlayerProgress[one2id]][1], RaceCheckpoints[gPlayerProgress[one2id]][2], 0.0, 0.0, 0.0, CHECK_SIZE); }
	    if(playerid == twoid) {new vehicleid = GetPlayerVehicleID(playerid);  RemovePlayerFromVehicle(playerid); DestroyVehicle(vehicleid); TogglePlayerControllable(playerid, 0);  GameTextForPlayer(playerid, "You finished.", 1000, 6); TogglePlayerControllable(two2id, 1); SetPlayerRaceCheckpoint(two2id, 0, RaceCheckpoints[gPlayerProgress[two2id]][0], RaceCheckpoints[gPlayerProgress[two2id]][1], RaceCheckpoints[gPlayerProgress[two2id]][2], 0.0, 0.0, 0.0, CHECK_SIZE); }
	    if(playerid == threeid) {new vehicleid = GetPlayerVehicleID(playerid);  RemovePlayerFromVehicle(playerid); DestroyVehicle(vehicleid);  TogglePlayerControllable(playerid, 0); GameTextForPlayer(playerid, "You finished.", 1000, 6); TogglePlayerControllable(three2id, 1); SetPlayerRaceCheckpoint(three2id, 0, RaceCheckpoints[gPlayerProgress[three2id]][0], RaceCheckpoints[gPlayerProgress[three2id]][1], RaceCheckpoints[gPlayerProgress[three2id]][2], 0.0, 0.0, 0.0, CHECK_SIZE); }
	    if(playerid == fourid) {new vehicleid = GetPlayerVehicleID(playerid);  RemovePlayerFromVehicle(playerid); DestroyVehicle(vehicleid);  TogglePlayerControllable(playerid, 0); GameTextForPlayer(playerid, "You finished.", 1000, 6); TogglePlayerControllable(four2id, 1); SetPlayerRaceCheckpoint(four2id, 0, RaceCheckpoints[gPlayerProgress[four2id]][0], RaceCheckpoints[gPlayerProgress[four2id]][1], RaceCheckpoints[gPlayerProgress[four2id]][2], 0.0, 0.0, 0.0, CHECK_SIZE); }
		if(playerid == one2id || playerid == two2id || playerid == three2id || playerid == four2id)
		{
			new vehicleid = GetPlayerVehicleID(playerid);  RemovePlayerFromVehicle(playerid); DestroyVehicle(vehicleid);  TogglePlayerControllable(playerid, 0);
			if(first != 999) { first=playerid; GameTextForPlayer(playerid, "you came first", 5000, 6); }
			else if(second != 999) { second=playerid; GameTextForPlayer(playerid, "you came second", 5000, 6);}
			else if(third != 999) { third=playerid;GameTextForPlayer(playerid, "you came third", 5000, 6); }
			else
			{
				fourth = playerid;
				
				GameTextForAll("The Game Has Ended", 5000, 5);
				RaceWinners();
			}
		}
	}
	else if(gPlayerProgress[playerid] == 14)
	{
		SetPlayerRaceCheckpoint(playerid, 1, RaceCheckpoints[gPlayerProgress[playerid]][0], RaceCheckpoints[gPlayerProgress[playerid]][1], RaceCheckpoints[gPlayerProgress[playerid]][2], 0.0, 0.0, 0.0, CHECK_SIZE);
	}
	else
	{
        SetPlayerRaceCheckpoint(playerid, 0, RaceCheckpoints[gPlayerProgress[playerid]][0], RaceCheckpoints[gPlayerProgress[playerid]][1], RaceCheckpoints[gPlayerProgress[playerid]][2], 0.0, 0.0, 0.0, CHECK_SIZE);
	}

	PlaySoundForPlayer(playerid, 1137);
	return 1;
}
RaceWinners()
{
	new name1[MAX_PLAYER_NAME], name2[MAX_PLAYER_NAME], name3[MAX_PLAYER_NAME], name4[MAX_PLAYER_NAME];
	new winnerslist[200];
	GetPlayerName(first, name1, sizeof(name1));
	GetPlayerName(second, name2, sizeof(name2));
	GetPlayerName(third, name3, sizeof(name3));
	GetPlayerName(fourth, name4, sizeof(name4));
	format(winnerslist, sizeof(winnerslist), "%s \n %s \n %s \n %s", name1,name2,name3,name4);
	for(new id=0; id<=MAX_PLAYERS; id++)
	{
		ShowPlayerDialog(id, 100, DIALOG_STYLE_MSGBOX, "Race Finished", winnerslist, "OK", "");
	}
	return 1;
}
PlaySoundForPlayer(playerid, soundid)
{
	new Float:pX, Float:pY, Float:pZ;
	GetPlayerPos(playerid, pX, pY, pZ);
	PlayerPlaySound(playerid, soundid,pX, pY, pZ);
}
public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	if(racestarted==true)
	{
		new Float:hp, Float:armor, Float:carhealth;
		new veh = GetPlayerVehicleID(playerid);
		GetPlayerHealth(playerid, hp);
		GetPlayerArmour(playerid, armor);
		GetVehicleHealth(veh, carhealth);
		if(hp < 1000) SetPlayerHealth(playerid, 1000);
		if(armor < 1000) SetPlayerHealth(playerid, 1000);
		if(carhealth < 1000) SetVehicleHealth(veh, 1000);
		RepairVehicle(veh);
	}
	
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
