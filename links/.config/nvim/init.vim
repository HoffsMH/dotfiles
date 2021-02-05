let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
  " passive gain  no binds added
  " Plug 'bling/vim-airline'

  " gcc to comment a single line and gc while selecting to
  " comment a selection
  Plug 'tpope/vim-commentary'

  " Passive gain, just colors Hex codes #eee, no binds added
  Plug 'ap/vim-css-color'

  Plug 'airblade/vim-gitgutter'

  " Somewhat Passive gain, not changing any settings, no binds added
  Plug 'mhinz/vim-startify'

  Plug 'terryma/vim-expand-region'
  Plug 'mg979/vim-visual-multi'

  " <leader>t to get a term
  Plug 'voldikss/vim-floaterm'

  Plug 'morhetz/gruvbox'

  Plug 'Yggdroot/indentLine'

  " Language specific stuff
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'elixir-editors/vim-elixir'
call plug#end()


" set window title depending on file
set title

" tells vim that the background is dark
set bg=dark

set go=a

" https://vim.fandom.com/wiki/Using_the_mouse_for_Vim_in_an_xterm
" all mouse support ?
set mouse=a

" use the sytem clipboard
set clipboard+=unnamedplus

set noshowmode
set noruler
set laststatus=0
set noshowcmd
set updatetime=200

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber

" Enable autocompletion:
	set wildmode=longest,list,full

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace ex mode with gq
	map Q gq

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!


" Automatically deletes all trailing whitespace and newlines at end of file on save.
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre * %s/\n\+\%$//e
    autocmd BufWritePre *.[ch] %s/\%$/\r/e

" Run xrdb whenever Xdefaults or Xresources are updated.
    autocmd BufRead,BufNewFile xresources,xdefaults set filetype=xdefaults
    autocmd BufWritePost .Xresources,Xdefaults,xresources,xdefaults !xrdb %

" Turns off highlighting on the bits of code that are changed, so the line that
" is changed is highlighted but the actual text that has changed stands out on
" the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Function for toggling the bottom statusbar:
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction


nnoremap <leader>h :call ToggleHiddenAll()<CR>
nnoremap <leader>t :FloatermNew<CR>


au BufRead,BufNewFile *.md setlocal textwidth=80
set nowrap
hi Visual term=reverse cterm=reverse guibg=Grey
set shiftwidth=2

let &colorcolumn = join(range(81,999), ',')
highlight ColorColumn ctermbg=240 guibg=white

map <C-e> <Plug>(expand_region_expand)

function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s" --hidden',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\	     '--no-preview '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })

set background=dark
colorscheme gruvbox
autocmd ColorScheme * highlight! link SignColumn LineNr

let g:floaterm_height=45
let g:floaterm_width=100
tnoremap <Esc> <C-\><C-N>

" fzf
nnoremap <C-p> :FloatermNew fzf<cr>
nnoremap <C-b> :Buffers<cr>
nnoremap <C-S-f> :Ag<cr>

nnoremap q :close<cr>
nnoremap <C-\> :vsp<cr>
set autowriteall

augroup custom_term
    autocmd!
    autocmd TermOpen * setlocal bufhidden=hide
augroup END

" automatically updates even during mundane events
autocmd CursorHold * update
autocmd CursorHold,CursorHoldI * update
autocmd TextChanged,TextChangedI <buffer> silent write

" example of how to set syntax on certain annoying files
au BufReadPost *.ezt set syntax=html
