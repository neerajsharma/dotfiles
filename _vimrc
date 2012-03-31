" Neeraj's VIM Settings {"
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"    _   _                      _ _      __     _____ __  __  
"   | \ | | ___  ___ _ __ __ _ (_| )___  \ \   / /_ _|  \/  | 
"   |  \| |/ _ \/ _ \ '__/ _` || |// __|  \ \ / / | || |\/| | 
"   | |\  |  __/  __/ | | (_| || | \__ \   \ V /  | || |  | | 
"   |_| \_|\___|\___|_|  \__,_|/ | |___/    \_/  |___|_|  |_| 
"                            |__/                             
" }

" General {
    set nocompatible
    call pathogen#infect()
    set clipboard=unnamed
    set showcmd
    set showmatch
    set ignorecase
    set smartcase
    set incsearch
    set hlsearch
    set wildignore=*.bak,*.o,*.lxa,*.phn,*.wwd,*.chn,*.cab,*.lib,*.map,*.ttf,*.mac,*.obj,*.e,*.xex,*.pdb,*.bmp,*.xdb,*.jpg,*.zip,*.png,*.rel,*.vspcc,*.gif,*~,*.exe,*.dll " wildmenu: ignore these extensions
    set autoread
    set smarttab
    set hidden "dont close the current file but hide it when opening another file
    set softtabstop=4
    set shiftwidth=4
    set tabstop=4
    set expandtab
    
    set ls=2
    set backspace=indent,eol,start  " backspacing over everything in insert mode
    set list
    set listchars=tab:>-,trail:~,extends:>,precedes:<,nbsp:·
    " no errors and bells
    set noerrorbells
    set novisualbell
    set vb t_vb=
    set magic "Set Magic on, for regular expressions
    
    " No backups needed
    set nobackup
    set nowb
    set noswapfile
    
    "set autochdir
    let g:session_autoload=1
    let g:session_autosave=1
    let mapleader = ","
    let g:mapleader = ","
    let g:proj_flags="imstvcg"
    
    " set the syntax on
    syntax on
    set ruler
    set nocp
    filetype on
    filetype indent on
    filetype plugin on
    set wildmenu
    set completeopt=longest,menuone 
    set nonu

    set grepprg=grep\ -nir\ $*

    " Setup Bundle Support {
    " The next two lines ensure that the ~/.vim/bundle/ system works
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()
    " }
" }

" Gui Stuff {
    if has("gui_running")
      set guioptions-=T
      set guioptions-=m
      set guioptions-=L
      set guioptions-=r
      set guioptions-=b
      set guifont=Consolas:h9:cANSI
      colorscheme molokai

      hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
      hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
      hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

     " highlight   Pmenu         guibg=lightgray guifg=darkblue gui=bold
     " highlight   PmenuSel      guibg=darkblue guifg=green
     " highlight   PmenuSbar     guibg=green guifg=red
     " highlight   PmenuThumb    guibg=white guifg=darkgreen
      "
      au guienter * simalt ~x
      :call libcallnr("vimtweak.dll", "SetAlpha", 253)

      " Provide a mapping for fullscreen 
       map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
    else

        if has('unix')
            colorscheme elflord
        endif

      highlight   clear

      highlight   Pmenu         ctermfg=0 ctermbg=3
      highlight   PmenuSel      ctermfg=0 ctermbg=7
      highlight   PmenuSbar     ctermfg=7 ctermbg=0
      highlight   PmenuThumb    ctermfg=0 ctermbg=7
      ":highlight Pmenu ctermbg=white ctermfg=darkblue gui=bold
    endif
" }

" Bundles {
    " Deps
        Bundle 'gmarik/vundle'
        Bundle 'mileszs/ack.vim'

    " General
        Bundle 'scrooloose/nerdtree'
        Bundle 'altercation/vim-colors-solarized'
        Bundle 'tpope/vim-surround'
        Bundle 'kien/ctrlp.vim'
        Bundle 'matchit.zip'
        Bundle 'Lokaltog/vim-powerline'
        Bundle 'Lokaltog/vim-easymotion'
        Bundle 'Align'

    " General Programming
        Bundle 'tpope/vim-fugitive'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'godlygeek/tabular'
        Bundle 'majutsushi/tagbar'
        Bundle 'Shougo/neocomplcache'
        Bundle 'Shougo/neocomplcache-snippets-complete'
        " Ultisnips clashes with neocomplcache
        " Bundle 'UltiSnips' 

    " Python
        " Pick either python-mode or pyflakes & pydoc

    " Javascript

    " HTML
        "Bundle 'HTML-AutoCloseTag'
        "Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'

    " Misc
        "Bundle 'spf13/vim-markdown'
" }

" Plugins {
    "
    " OmniComplete {

        set ofu=syntaxcomplete#Complete
        " autocmd FileType python set omnifunc=pythoncomplete#Complete

        "==================================================
        " Omnicppcomplete options
        "==================================================
         set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
          let OmniCpp_GlobalScopeSearch   = 1
          let OmniCpp_DisplayMode         = 1
          let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
          let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
          let OmniCpp_ShowAccess          = 1 "show access in pop-up
          let OmniCpp_SelectFirstItem     = 0 "select first item in pop-up
          set completeopt=menuone,menu,longest
    "  }

    "NERDTree Customization {
        let NERDTreeHijackNetrw = 0
        let NERDTreeWinPos = "left"
        let NERDTreeShowBookmarks=1
    " }

    " Ctags {
        if has('unix')
            set tags+=/cygdrive/c/t/vim/TAGS
            set tags+=/cygdrive/c/t/vim/UXPTAGS
        else
            set tags+=./TAGS;/,../TAGS
            set tags+=c:\t\vim\TAGS
            set tags+=c:\t\vim\UXPTAGS
        endif
    " }

    " Tagbar {
        let g:tagbar_autofocus=1
        let g:tagbar_ctags_bin="c:/tools/ctags/ctags.exe"
        " }
        "
        " Supertab {
        "let g:SuperTabMappingTabLiteral='<c-tab>'
        "let g:SuperTabMappingForward='<tab>'
        "let g:SuperTabMappingBackward='<s-tab>'
        "let g:SuperTabDefaultCompletionType = 'context'
    " }

        
        "Neocomplcache {
        "
        " Disable AutoComplPop.
        let g:acp_enableAtStartup = 0
        " Use neocomplcache.
        let g:neocomplcache_enable_at_startup = 1
        " Use smartcase.
        let g:neocomplcache_enable_smart_case = 1
        " Use camel case completion.
        let g:neocomplcache_enable_camel_case_completion = 1
        " Use underbar completion.
        let g:neocomplcache_enable_underbar_completion = 1
        " Set minimum syntax keyword length.
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

        " SuperTab like snippets behavior.
        imap <silent><expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

        " Plugin key-mappings.
        imap <C-space>     <Plug>(neocomplcache_snippets_expand)
        smap <C-space>     <Plug>(neocomplcache_snippets_expand)
        inoremap <expr><C-g>     neocomplcache#undo_completion()
        inoremap <expr><C-;>     neocomplcache#complete_common_string()

        " <CR>: close popup 
        " <s-CR>: close popup and save indent.
        inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup() "\<CR>" : "\<CR>" 
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()

        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
          let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
        let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
    " }
" }

" Functions {

func! Cwd()
  let cwd = getcwd()
  return "e " . cwd 
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  if MySys() == "linux" || MySys() == "mac"
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  endif
  if g:cmd == g:cmd_edited
    if MySys() == "linux" || MySys() == "mac"
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    endif
  endif   
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc

" This is literally stolen from Vim help. The only changes are:
" (1) if w != "" becomes if w =~ "\k"
" (2) exe "silent! ptag " . w becomes exe "silent! psearch " . w
" * The first change prevents PreviewWord of searching while cursor is on some
" non-keyword characters, e.g. braces, asterisks, etc.
function! PreviewWord()
  let w = expand("<cword>") " get the word under cursor
    " Try displaying a matching tag for the word under the cursor
    let v:errmsg = ""
    exe "silent! ptag " . w
endfunction

" Search across all the open 
" buffers in vim
function! SearchBuffers(query)
    :call setqflist([])
    :bufdo vimgrepadd! a:query %
    :copen
endfunction

" }

" KEYBINDINGS {
    "": search for visually highlighted text
    :vmap // y/<C-R>"<CR>
    
    :nnoremap <leader><leader> :nohlsearch<cr>
    :nmap <leader>p :call PreviewWord()<CR>
    map <leader>a :FSHere<CR>
    
    "" All <leader>s commands. S is for External or menu items {
    :nnoremap <leader>sul :colorscheme tomorrow<CR>
    :nnoremap <leader>sud :colorscheme molokai<CR>
    map <leader>sun :set go-=m<cr>
    map <leader>sum :set go+=m<cr>
    nmap <leader>sf  :!start "c:\program files\internet explorer\iexplore.exe" "www.google.com/search?q=<C-R><C-W>"<CR>
    nmap <leader>sc  :!start "C:\Users\neerajsh\AppData\Local\Google\Chrome\Application\chrome.exe" "www.google.com/search?q=<C-R><C-W>" "chrome://newtab"<CR>
    nmap <leader>swt  :!start "C:\Users\neerajsh\AppData\Local\Google\Chrome\Application\chrome.exe" "http://www.wsdot.wa.gov/traffic/seattle/" "chrome://newtab"<CR>
    nmap <leader>si  :!start "c:\program files\internet explorer\iexplore.exe" "http://msw/searchcenter/pages/results.aspx?k=<C-R><C-W>&s=Intranet"<CR>
    map <leader>st :!c:\tools\generate_ctags_vim.bat<CR>
    "}

    " <leader> n commands {
        nnoremap <leader>nf :NERDTreeFind<CR>
        nnoremap <leader>nt :NERDTreeToggle<CR>
        nnoremap <leader>nt :TagbarToggle<CR>
    " }
    
    "" All <leader>f commands {
    map <leader>fg :vimgrep <C-R><C-W> * <CR>:copen<CR>
    map <leader>fe :e!~/_vimrc<cr>
    map <leader>fs :so ~/_vimrc<cr>
    map <leader>fl :FSSplitRight<CR>
    map <leader>fh :FSSplitLeft<CR>
    map <leader>fj :FSSplitBelow<CR>
    map <leader>fa :FSSplitAbove<CR>

    " }
    "" Add <leader>i commands. i is for inserting something from normal mode
    map <leader>id :e <C-R>=expand("%:p:h") . "/" <CR>

    nnoremap + :set guifont=Consolas:h11:cANSI<CR>
    nnoremap - :set guifont=Consolas:h9:cANSI<CR>

    nnoremap <backspace> 10<c-y>10k
    nnoremap <S-k> 5<c-y>5k

    inoremap kj <ESC>
    nnoremap <leader>u :GundoToggle<cr>
    nnoremap <leader>b :CtrlPBuffer<CR>

    nnoremap <space> 10<c-e>10j
    nnoremap <backspace> 10<c-y>10k
    nnoremap <A-j> 5<c-e>5j
    nnoremap <A-k> 5<c-y>5k

    inoremap kj <ESC>
    nmap <F7>  :NERDTreeToggle<CR> 
    nmap <F8> :TagbarToggle<CR>

    " Open and close the taglist.vim separately 
    nmap <F6>  :TagbarOpen<CR>:NERDTreeToggle<CR> 
    nmap <F2> :Project<CR>
    map <F5> :make<CR>:copen<CR>

    nnoremap <leader>i t;i 

    inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>" 
    inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>" 
    inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>" 

    
    "Window mappings
    let g:C_Ctrl_j='off' " needed to unmap Ctrl-J
    nnoremap <C-j> <C-W>j
    nmap <C-k> <C-W>k
    nmap <C-h> <C-W>h
    map <C-l> <C-W>l
    inoremap <A-d>  <ESC>dBa
    inoremap <C-d>  <ESC>lxi

    " Split mappings
    nmap <leader>vs :split<CR>
    nmap <silent> <leader>vv :vsplit<CR>
    
    "MS Sd mappings
    nmap <silent> <leader>mc :call SDCheckOut()<CR>
    nmap <silent> <leader>md :!sd diff %<CR>
    nmap <silent> <leader>mad :!sd diff ...<CR>
    nmap <silent> <leader>mv :!sdv ... <CR>
    nmap <silent> <leader>mo :!sd opened ... <CR>
    
    iab ddate =strftime(”%A(%d) %B(%m) %Y”)
    iab ttime =strftime(”%H:%M”) vmap ,mc !boxes -d c-cmt<CR>

    "#autocmd guienter * simalt ~x
    map ; :

    " command line stuff
    cno $h e ~/
    cno $d e /users/neerajsh/
    cno $j e ./
    cno $a e /
    cno $s e c:/src
    cno $x e f:/upf/src/runtimes/silverlight/xcp
    cno $c e <C-\>eCurrentFileDir("e")<cr>

    " $q is super useful when browsing on the command line
    cno $q <C-\>eDeleteTillSlash()<cr>


    " Bash like keys for the command line
    cnoremap <C-A>      <Home>
    cnoremap <C-E>      <End>
    cnoremap <C-K>      <C-U>

    " cnoremap <C-P> <Up>
    " cnoremap <C-N> <Down>

    " Open a side note for current file

    "
    "-------------------------------------------------------------------------------
    " Fast switching between buffers
    " The current buffer will be saved before switching to the next one.
    " Choose :bprevious or :bnext
    "-------------------------------------------------------------------------------
    "
    " map  <silent> <C-tab>  <Esc>:if &modifiable && !&readonly && 
    "      \                  &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
    " imap  <silent> <C-tab>  <Esc>:if &modifiable && !&readonly && 
    "      \                  &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
    " map  <silent> <S-C-tab>  <Esc>:if &modifiable && !&readonly && 
    "      \                  &modified <CR> :write<CR> :endif<CR>:bnext<CR>
    " imap  <silent> <S-C-tab>  <Esc>:if &modifiable && !&readonly && 
    "      \                  &modified <CR> :write<CR> :endif<CR>:bnext<CR>
    "
    "-------------------------------------------------------------------------------
    " Leave the editor with Ctrl-q : Write all changed buffers and exit Vim
    "-------------------------------------------------------------------------------
    nmap  <C-q>    :wqa<CR>
    "
" }

" Language Settings {

    autocmd BufNewFile * silent! 0r $HOME/vimfiles/templates/%:e.tpl
    "-------------------------------------------------------------------------------
    " Change the working directory to the directory containing the current file
    "-------------------------------------------------------------------------------
    if has("autocmd")
      autocmd BufEnter * :lchdir %:p:h
    endif " has("autocmd")

    "==================================================================================================== 
    " Programming Language Settings
    "==================================================================================================== 

    " C.vim customizations
    let c_comment_strings=1
    let c_errors = 1
    augroup cpp
        au FileType cpp setlocal makeprg=build\ /cZ
        set errorformat=%f(%l\\,%c)\ :\ %trror\ CS%n:\ %m,
                           \%f(%l)\ \:\ %trror\ C%n\:\ %m,
                           \%f(%l)\ \:\ %trror\ U%n\:\ %m,
                           \NMAKE\ \:\ \ %trror\ U%n\:\ %m
    augroup END

    au Syntax c source $HOME/vimfiles/plugin/ntcxx.vim
    au Syntax cpp source $HOME/vimfiles/plugin/ntcxx.vim

    " Xaml
    au BufNewFile,BufRead *.xaml setf xml

    " Setup cindent options:
     "  :0  -  'case' statements line up with 'switch' statements
     "  l1  -  statements in a 'case' indent based on the indentation of the 'case'
     "  g0  -  C++ protection directives line upwith the class declaration
     "  (1s -  extra lines inside an open paren indent 1 tab
    " CIndent  Options
    set cino=:0,l1,g0,(1s

" }

