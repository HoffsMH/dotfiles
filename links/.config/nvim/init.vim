let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

  " gcc to comment a single line and gc while selecting to
  " comment a selection
  Plug 'tpope/vim-commentary'
  Plug 'amadeus/vim-mjml'
  Plug 'tpope/vim-surround'
  Plug 'junegunn/vim-easy-align'
  Plug 'jiangmiao/auto-pairs'
  Plug 'dense-analysis/ale'
"  Plug 'pangloss/vim-javascript'
  Plug 'ruanyl/vim-gh-line'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


  " Passive gain, just colors Hex codes #eee, no binds added
  Plug 'ap/vim-css-color'

  Plug 'airblade/vim-gitgutter'

  " Somewhat Passive gain, not changing any settings, no binds added
  Plug 'mhinz/vim-startify'

  Plug 'terryma/vim-expand-region'
  Plug 'mg979/vim-visual-multi'

  " <leader>t to get a term
  " Plug 'voldikss/vim-floaterm' , { 'commit': 'b838dd126c4fc0a595590d495c35a1f75483aa3d'}
  Plug 'voldikss/vim-floaterm'

  Plug 'morhetz/gruvbox'
  Plug 'dracula/vim'


  Plug 'Yggdroot/indentLine'

  " Language specific stuff
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'elixir-editors/vim-elixir'
  Plug 'cespare/vim-toml'
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
"set clipboard*=primary

set noshowmode
set noruler
set laststatus=2
set noshowcmd
set updatetime=200
set autoread
au CursorHold * checktime

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number
	nmap <leader>n :set invnumber<CR>

" Enable autocompletion:
	set wildmode=longest,list,full

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>
	map <leader>z :noh<CR>
	map <leader>y :let @+ = join([expand('%'), line(".")], ':')<cr>

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
set t_Co=256

set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm

autocmd ColorScheme * highlight! link SignColumn LineNr

let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

colorscheme gruvbox

let g:floaterm_height=45
let g:floaterm_width=100
tnoremap <Esc> <C-\><C-N>

" fzf
nnoremap <C-p> :FloatermNew --opener=edit --height=0.95 --width=0.95 fzf<cr>
nnoremap <leader>l :FloatermNew --opener=edit --height=0.95 --width=0.95 lf .<cr>
nnoremap <C-S-f> :Ag <space>

nnoremap q :close<cr>
nnoremap <C-\> :vsp<cr>

nnoremap <leader>c :e ~/personal/00-capture/capture.md<cr>
nnoremap <leader>i :e ~/.config/nvim/init.vim<cr>

set autowriteall

augroup custom_term
    autocmd!
    autocmd TermOpen * setlocal bufhidden=hide
augroup END

augroup ok
  au!
  au FileType * setlocal expandtab
augroup END

" automatically updates even during mundane events
autocmd CursorHold * update
autocmd CursorHold,CursorHoldI * update
autocmd TextChanged,TextChangedI <buffer> silent write

" example of how to set syntax on certain annoying files
au BufReadPost *.ezt set syntax=html

autocmd FileType javascript setlocal expandtab!
autocmd FileType handlebars setlocal expandtab!

" code folding setup press zm and zr and zR to modify by indent level
set fdm=indent fdls=5 fdn=5

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
