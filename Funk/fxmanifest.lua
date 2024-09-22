fx_version 'cerulean'
game 'gta5'

ui_page 'web/index.html'

shared_scripts {
    '@a_extended/imports.lua',
}

client_scripts {
	"client/Player.lua",
    "client/nui.lua"
}

files {
    'web/img/*.svg',
    'web/index.html',
    'web/fonts/*.*',
    'web/script.js',
    'web/main.css'
}