-- DO NOT EDIT ANYTHING HERE; YOU ARE PROHIBITED AND YOU CAN RUIN THE RESOURCE! --

fx_version 'cerulean'
game 'gta5'

name 'Identifiers'
description 'Saves the identifiers of all players entering the game, and sending embeds to Discord!'
author 'Tuggummi'
version '1.0.0'

dependency 'mysql-async'

server_scripts {
    'sv_identifier.lua',
    'Config.lua',
    '@mysql-async/lib/MySQL.lua',
}