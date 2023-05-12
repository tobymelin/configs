wezterm:
	@if [ -f $(HOME)/.wezterm.lua ]; then mv $(HOME)/.wezterm.lua $(HOME)/.wezterm.lua.bak; fi

	ln -s $(PWD)/wezterm.lua $(HOME)/.wezterm.lua
