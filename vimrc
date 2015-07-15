" restarted from scratch 2015-03-01

" To use this:
"  1. Start clean (recommended for Vundle):
"     Rename .vimrc and .vim/ and recreate .vim/ directory
"  2. Clone the Vundle Git repository into a
"     subdirectory .vim/bundle:
"     $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"  3. Copy this .vimrc into your home directory
"  4. Fire up vim and enter command :VundleInstall
"  5. YouCompleteMe requires cmake, python-dev and some other build essentials
"     (install with package manager)
"     NOTE: Does not work on Raspberry Pi
"     Build it:   $ YCM_CORES=1 ./install.sh --clang-completer


"=========================================================================================
" include Vundle
"-----------------------------------------------------------------------------------------

set nocompatible            " be iMproved, required (by Vundle?!), probably just to be sure
filetype off                " required (by Vundle?!)

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" Syntax:
"   Plugin 'name/repo'    -- GitHub
"   Plugin 'name'         -- vim-scripts.org
"   Plugin 'git://....'   -- other Git repo not at GitHub

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
       " Vundle - Vim Plugin Manager
       " Installation:
       "   see above
       " Use:
       "   :VundleSearch - search for Plugins
       "   :VundleInstall - process this list and install/update all
Plugin 'fugitive.vim'
       " Fugitive -- Git plugin
Plugin 'Valloric/YouCompleteMe'
       " YouCompleteMe -- C/C++ auto complete
       " Install:
       "   $ cd YouCompleteMe
       "   $ ./install.sh --clang-completer
       " Use:
       "   ... (tbd)
Plugin 'Command-T'
       " search/open files
Plugin 'The-NERD-tree'
       " search/open files
Plugin 'bling/vim-airline'
       " airline -- informative status line
Plugin 'chrisbra/csv.vim'
       " csv -- Comfortably edit comma separated value files
       " Help:
       "   :help ft-csv.txt

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"=========================================================================================



" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" my settings (from .vimrc.bak_2015-03-01)


"=========================================================================================
" whitespace
"-----------------------------------------------------------------------------------------
set shiftwidth=4  " intent with >> and Ctrl-T by 4 characters
set tabstop=4     " ASCII-9 (^I) will be 4 characters
set expandtab     " never use TAB-character (^I), replace with spaces (4, see tabstop)
set nojoinspaces  " don't add two spaces after .!? (only a single one)
"set cin

set listchars=tab:»_,eol:¶,nbsp:~
" set list listchars=tab:\|_,eol:¶,nbsp:~

" Tab and buffer handling
set switchbuf=usetab,newtab
" gf: open file in new tab
nnoremap gf <C-w>gf


"=========================================================================================
" Settings for NERDTrree
"-----------------------------------------------------------------------------------------
" Toggle NERDTree on <leader>e (\e)
nmap \e :NERDTreeToggle<CR>


"=========================================================================================
" Settings for Airline
"-----------------------------------------------------------------------------------------
set laststatus=2    " show airline for buffers without splits and empty tabs


"=========================================================================================
" searching
"-----------------------------------------------------------------------------------------
set hlsearch
set incsearch     " search as your type
"set ignorecase
"set smartcase


"=========================================================================================
" visual appearance
"-----------------------------------------------------------------------------------------
set number
set guifont=DejaVu\ Sans\ Mono\ 9

set showcmd
set visualbell    " don't beep on errors or superfluous ESC, but blink
                  " see: http://vim.wikia.com/wiki/Disable_beeping

if &term=="xterm"
    set mouse=a
endif

colorscheme blue


"=========================================================================================
" improvement of spell-check
"-----------------------------------------------------------------------------------------
" standard colors for SpellCap are not compatible with colorscheme blue
"hi SpellBad term=reverse ctermbg=9 gui=undercurl guisp=Red
hi SpellCap term=reverse ctermbg=12 gui=undercurl guisp=Yellow
"hi SpellRare term=reverse ctermbg=13 gui=undercurl guisp=Magentha
"hi SpellLocal term=reverse ctermbg=14 gui=undercurl guisp=Cyan


"=========================================================================================
" macros and aliases
"-----------------------------------------------------------------------------------------

" create line of === (from input mode, proceed in input mode below line)
imap <F5> <ESC>yypVr=o
imap <F6> <ESC>yypVr-o
"imap <F6> <ESC>:%s:"[\.\.\/]*lib\/\([a-z]*\.h\)":<\1>:

" map F12 to !make
map <F12> <ESC>:wa<CR>:!make quick<CR>

" German Umlauts in with non-German keyboard layout:
" <Leader>u -> ü
imap <Leader>a ä
imap <Leader>o ö
imap <Leader>u ü
imap <Leader>A Ä
imap <Leader>O Ö
imap <Leader>U Ü
imap <Leader>s ß

" in TeX and BibTex files: <Leader>u -> {\"u}
autocmd Filetype tex,bib imap <buffer> <Leader>a {\"a}
autocmd Filetype tex,bib imap <buffer> <Leader>o {\"o}
autocmd Filetype tex,bib imap <buffer> <Leader>u {\"u}
autocmd Filetype tex,bib imap <buffer> <Leader>A {\"A}
autocmd Filetype tex,bib imap <buffer> <Leader>O {\"O}
autocmd Filetype tex,bib imap <buffer> <Leader>U {\"U}
autocmd Filetype tex,bib imap <buffer> <Leader>s {\ss}


" open *.md files as markdown
au BufNewFile,BufRead *.md setlocal ft=markdown

" from http://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
" C-\   Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" look in the current dir for "tags" and work up the tree towards root until
" one is found
set tags=tags;/



" from: http://stackoverflow.com/a/4237882
" use:
"   :call IncludeGuard()
" TODO: use in autocmd or simliar
function! IncludeGuard()
  let basename = expand("%:t:r")
  let includeGuard = '__' . basename . '_h__'
  call append(0, "#ifndef " . includeGuard)
  call append(1, "#define " . includeGuard)
  call append(line("$"), "#endif /* !" . includeGuard . " */")
endfunction



"=========================================================================================
" Settings for YouCompleteMe
"-----------------------------------------------------------------------------------------
" add diagnostic messages from compiling to the location list (:lopen, :lclose)
let g:ycm_always_populate_location_list = 1
" open GoTo* commands in new tab
let g:ycm_goto_buffer_command = 'new-tab'






"=========================================================================================
" Closing options (must be at end of vimrc)
"-----------------------------------------------------------------------------------------
" allow .exrc (or .vimrc) in current working directory (for project specific settings)
set exrc

" last line:
set secure
