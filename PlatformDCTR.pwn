#include <a_samp>

#include <zcmd>

native SendClientCheck(playerid, type, arg, offset, size);
forward OnClientCheckResponse(playerid, type, arg, response);
#define IsPlayerAndroid(%0)                 !GetPVarInt(%0, "NotAndroid") == 0

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

public OnPlayerConnect(playerid)
{
    SendClientCheck(playerid, 0x48, 0, 0, 2);
	return 1;
}

CMD:test(playerid, params[])
{
    new szMessage[128];
    format(szMessage, sizeof(szMessage), "PLATFORM: %s", IsPlayerAndroid(playerid) ? ("Mobile") : ("PC"));
    SendClientMessage(playerid, 0xFFFFFFFF, szMessage);
    return 1;
}
