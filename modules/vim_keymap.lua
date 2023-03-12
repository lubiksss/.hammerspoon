local vim_keymap_obj = {}

-- vim mode draft

local mod = {
	empty = {},
	shift = {"shift"},
	alt = {"alt"},
	cmd = {"cmd"},
	ctrl = {"ctrl"},
	cmd_and_shift = {"cmd", "shift"},
}

local vim_mode = true

local fastKeyStroke = function(modifier, event_char)
	hs.eventtap.keyStroke(modifier, event_char, 30)
end

local h_bind = hs.hotkey.new({}, "h",
	function() fastKeyStroke(mod.empty, "left") end,
	nil,
	function() fastKeyStroke(mod.empty, "left") end):enable()
local j_bind = hs.hotkey.new({}, "j",
	function() fastKeyStroke(mod.empty, "down") end,
	nil,
	function() fastKeyStroke(mod.empty, "down") end):enable()
local k_bind = hs.hotkey.new({}, "k",
	function() fastKeyStroke(mod.empty, "up") end,
	nil,
	function() fastKeyStroke(mod.empty, "up") end):enable()
local l_bind = hs.hotkey.new({}, "l",
	function() fastKeyStroke(mod.empty, "right") end,
	nil,
	function() fastKeyStroke(mod.empty, "right") end):enable()

local i_bind = hs.hotkey.new({}, "i",
	function()
		vim_keymap_obj.set_vim_mode()
	end):enable()
local a_bind = hs.hotkey.new({}, "a",
	function()
		vim_keymap_obj.set_vim_mode()
	end):enable()
local o_bind = hs.hotkey.new({}, "o",
	function()
		fastKeyStroke(mod.cmd, "right")
		fastKeyStroke(mod.empty, "return")
		vim_keymap_obj.set_vim_mode()
	end):enable()
local shift_a_bind = hs.hotkey.new({"shift"}, "a",
	function()
		fastKeyStroke(mod.cmd, "right")
		vim_keymap_obj.set_vim_mode()
	end):enable()
local shift_o_bind = hs.hotkey.new({"shift"}, "o",
	function()
		fastKeyStroke(mod.cmd, "left")
		fastKeyStroke(mod.empty, "return")
		fastKeyStroke(mod.empty, "up")
		vim_keymap_obj.set_vim_mode()
	end):enable()
local shift_i_bind = hs.hotkey.new({"shift"}, "i",
	function()
		fastKeyStroke(mod.cmd, "left")
		vim_keymap_obj.set_vim_mode()
	end):enable()
local esc_bind = hs.hotkey.new({}, "escape",
	function()
		vim_keymap_obj.set_vim_mode()
		fastKeyStroke(mod.empty, "escape")
	end):enable()
local enter_bind = hs.hotkey.new({}, "return",
	function()
		vim_keymap_obj.set_vim_mode()
		fastKeyStroke(mod.empty, "return")
	end):enable()
local delete_bind = hs.hotkey.new({}, "delete",
	function()
		vim_keymap_obj.set_vim_mode()
		fastKeyStroke(mod.empty, "delete")
	end):enable()

function set_vim_keymap()
	h_bind:enable()
	j_bind:enable()
	k_bind:enable()
	l_bind:enable()
	o_bind:enable()
	i_bind:enable()
	a_bind:enable()
	shift_a_bind:enable()
	shift_o_bind:enable()
	shift_i_bind:enable()
	esc_bind:enable()
	enter_bind:enable()
	delete_bind:enable()
end

function unset_vim_keymap()
	h_bind:disable()
	j_bind:disable()
	k_bind:disable()
	l_bind:disable()
	o_bind:disable()
	i_bind:disable()
	a_bind:disable()
	shift_a_bind:disable()
	shift_o_bind:disable()
	shift_i_bind:disable()
	esc_bind:disable()
	enter_bind:disable()
	delete_bind:disable()
end

local vim_mode_menubar = hs.menubar.new()
function vim_keymap_obj:set_vim_mode()
	if vim_mode == true then
		unset_vim_keymap()
		vim_mode_menubar:setTitle()
		vim_mode = false
    else
		set_vim_keymap()
		vim_mode_menubar:setTitle("𝑽")
		vim_mode = true
	end
end

function vim_keymap_obj:bind_vim_keymap_with(modifier, key)
    hs.hotkey.bind(modifier, key, vim_keymap_obj.set_vim_mode)
end


return vim_keymap_obj
