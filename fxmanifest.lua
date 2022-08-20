fx_version "cerulean"

description "Netvar - Easiest way to Network Variables consistently!"
author "imMadsen"
version '1.0.0'

lua54 'yes'
games { "gta5", "rdr3" }

client_script "client.lua"
server_script "server.lua"
escrow_ignore {"shared.lua", "client.lua", "server.lua"} 
