-- All supported time zones. If your desired zone is not included simply add it.
-- https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
local timeZones = {
    ['America/Los_Angeles'] = {
        standard_offset = -8,
        daylight_offset = -7
    }
}

local function getDateTime()
    local utcTime = os.time()
    local date = os.date("*t", utcTime)

    local timeZone = timeZones[BondrixClock.Config.timeZone]

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

if BondrixClock.Config.sync then
    CreateThread(function()
        while true do
            GlobalState.time = BondrixClock.GetTime()
            GlobalState.date = BondrixClock.GetDate()

            Wait(BondrixClock.Config.syncInterval)
        end
    end)
end

AddEventHandler('playerJoining', function()
    local player = source
    TriggerClientEvent('bondrix-clock:client:onTimeSet', player, BondrixClock.GetTime())
    TriggerClientEvent('bondrix-clock:client:onDateSet', player, BondrixClock.GetDate())
end)