-- 1 real minute per game minute.
SetMillisecondsPerGameMinute(60000)

function BondrixClock.SetTime(time)
    NetworkOverrideClockTime(time.hour, time.minute, time.second)
end
RegisterNetEvent('bondrix-clock:client:onTimeSet')
AddEventHandler('bondrix-clock:client:onTimeSet', function(time)
    BondrixClock.SetTime(time)
end)
AddStateBagChangeHandler('time', 'global', function(_, _, time)
    TriggerEvent('bondrix-clock:client:onTimeSet', time)
end)

function BondrixClock.SetDate(date)
    SetClockDate(date.day, date.month, date.year)
end
RegisterNetEvent('bondrix-clock:client:onDateSet')
AddEventHandler('bondrix-clock:client:onDateSet', function(date)
    BondrixClock.SetDate(date)
end)
AddStateBagChangeHandler('date', 'global', function(_, _, date)
    TriggerEvent('bondrix-clock:client:onDateSet', date)
end)