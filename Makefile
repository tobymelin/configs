wezterm:
	@if [ -f $(HOME)/.wezterm.lua ]; then mv $(HOME)/.wezterm.lua $(HOME)/.wezterm.lua.bak; fi

	ln -s $(PWD)/wezterm.lua $(HOME)/.wezterm.lua

yabai:
	@if [ -f $(HOME)/.yabairc ]; then mv $(HOME)/.yabairc $(HOME)/.yabairc.bak; fi
	@if [ -f $(HOME)/.skhdrc ]; then mv $(HOME)/.skhdrc $(HOME)/.skhdrc.bak; fi

	ln -s $(PWD)/yabairc $(HOME)/.yabairc
	ln -s $(PWD)/skhdrc $(HOME)/.skhdrc
