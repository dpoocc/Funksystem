fx_version 'cerulean'
game 'gta5'

ui_page 'web/index.html'

shared_scripts {
    '@es_extended/imports.lua',
}

client_scripts {
	"client/Player.lua",
    "client/nui.lua"
}

files {
    'web/img/*.svg',
    'web/index.html',
    'web/fonts/*.*',
    'web/main.css'
}