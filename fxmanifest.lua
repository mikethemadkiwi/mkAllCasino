fx_version "cerulean"
games {"gta5"}
dependencies {
    'PolyZone'
}
files {
    'nui/ui.html',
    'nui/ui.css',
    'nui/ui.js'
}
ui_page "nui/ui.html"
client_scripts {
  '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/EntityZone.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/ComboZone.lua'
}
client_scripts {
  'teleports.lua', -- vehicle and player teleport positions & permissions.
  'elevators.lua', -- elevator positions & permissions
  'doors.lua', -- door positions & permissions
  'client.lua'
}