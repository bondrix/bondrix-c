local identifiers = {
    ['America/Los_Angeles'] = {
        standard_offset = -8,
        daylight_offset = -7
    }
}
local function getDateTime()
    local utcTime = os.time()
    local date = os.date("*t", utcTime)

    local timeZone = identifiers[BondrixClock.Config.timeZoneIdentifier]

    local offset = os.date("*t").isdst and timeZone.daylight_offset or timeZone.standard_offset
    local time = os.date("*t", utcTime + offset * 3600)

    return time
end

function BondrixClock.GetTime()
    local dateTime = getDateTime()
    return { hour = dateTime.hour, minute = dateTime.min, second = dateTime.sec}
end

function BondrixClock.GetDate()
    local dateTime = getDateTime()
    return { week_day = dateTime.wday, day = dateTime.day, month = dateTime.month, year = dateTime.year}
end

CreateThread(function()
    while true do
        Wait(BondrixClock.Config.interval)
        GlobalState.time = BondrixClock.GetTime()
        GlobalState.date = BondrixClock.GetDate()

        --Wait(BondrixClock.Config.interval)
    end
end)

AddEventHandler('playerJoining', function()
    local player = source
    print('PLAYER JOINED') -- Debug
    TriggerClientEvent('bondrix-clock:client:onTimeSet', player, GlobalState.time)
    TriggerClientEvent('bondrix-clock:client:onDateSet', player, GlobalSate.date)
end)