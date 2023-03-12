-- eng/kor
local FRemap = require('foundation_remapping')
local remapper = FRemap.new()
remapper:remap('rcmd','f18')
remapper:register()

require('./modules/change_input_source_if_ko'):bind_change_input_source_with({}, "escape")
require('./modules/vim_keymap'):bind_vim_keymap_with({"cmd","shift"}, "space")
