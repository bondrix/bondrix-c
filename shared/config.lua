BondrixClock.Config = {}

-- The time zone to sync the time and date to.
-- Currently only 'America/Los_Angeles' is supported.
BondrixClock.Config.timeZone = 'America/Los_Angeles'

-- Should the server attempt to sync the time and date after initializing?
BondrixClock.Config.sync = true
-- How often should the server attempt to sync the time to all clients (in milliseconds)?
-- Default is 1000 ms, meaning every seconds. You should keep this value relatively low.
BondrixClock.Config.syncInterval = 1000