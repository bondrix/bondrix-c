fx_version 'cerulean'
game 'gta5'

author 'Bondrix'
description 'A customizable clock that syncs the FiveM''s server time and date to a specified time zone.'
repository 'https://github.com/bondrix/bondrix-clock'
version '1.0.0'

client_scripts {
    'client/main.lua'
}
shared_scripts {
    'shared/main.lua',
    'shared/config.lua'
}
server_scripts {
    'server/main.lua'
}