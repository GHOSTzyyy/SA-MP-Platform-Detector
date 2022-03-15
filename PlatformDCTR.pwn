#include <a_samp>

#include <zcmd>

#define IsPlayerAndroid(%0)                 GetPVarInt(%0, "NotAndroid") == 0

forward OnClientCheckResponse(playerid, type, arg, response);
public OnClientCheckResponse(playerid, type, arg, response)
{
    switch(type)
    {
        case 0x48:
        {
            SetPVarInt(playerid, "NotAndroid", 1);
        }
    }
    return 1;
}

// Or

public OnClientCheckResponse(playerid, type, arg, response)
{
    switch(type)
    {
        case 0x48:
        {
            SetPVarInt(playerid, "NotAndroid", 1);
        }
    }
    return 1;
}

CMD:test(playerid, params[])
{
	new szMessage[128];
    format(szMessage, sizeof(szMessage), "(TEST)[%s] %s: %s", IsPlayerAndroid(playerid) ? ("Mobile") : ("PC"), GetPlayerName(playerid), params);
    SendClientMessage(playerid, 0xFFFFFFFF, szMessage);
    return 1;
