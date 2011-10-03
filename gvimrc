function GuiTabLabel()
	let buflist = tabpagebuflist(v:lnum)

	" add the tab number
	let label = '[' . tabpagenr()

	" count number of open windows in the tab
	let wincount = tabpagewinnr(v:lnum, '$')
	if wincount > 1
		let label .= ':' . wincount
	endif

	let label .= '] '

	" add the file name without path information
	let file   = bufname(buflist[tabpagewinnr(v:lnum) - 1])
	let label .= fnamemodify(file, ':t')

	" modified since the last save?
	for bufnr in buflist
		if getbufvar(bufnr, '&modified')
			let label .= '+'
			break
		endif
	endfor

	return label
endfunction

set guitablabel=%{GuiTabLabel()}

colorscheme desert
highlight Statement gui=none
highlight Type      gui=none

" gvim-win32 specific settings
if has("win32")
	set directory=.,$TEMP
	set guifont=Lucida\ Console:h8
	set printfont=Lucida\ Console:h8
	source $VIMRUNTIME/mswin.vim
else
	set guifont=Monospace\ 8
	set printfont=Monospace\ 8
endif

:runtime! plugin/tohtml.vim
