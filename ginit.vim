" Set options for neovim gui
" if exists('g:GuiLoaded')
call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
call rpcnotify(0, 'Gui', 'Font', 'Cascadia Mono:h11', 1)
call rpcnotify(0, 'Gui', 'Option', 'Popupmenu', 0)
" endif
