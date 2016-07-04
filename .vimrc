set shell=/bin/zsh

set t_Co=256
"call pathogen#infect()
" vi との互換性OFF
 set nocompatible
" ファイル形式の検出を無効化
filetype off

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" =============mysettings================

"vimcolors
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'

" vimdoc 日本語
NeoBundle 'yuroyoro/vimdoc_ja'

"powerLine
NeoBundle 'Lokaltog/vim-powerline'

" 補完 autocomplpop.vim : insertmodeで自動で補完をpopup
NeoBundle 'AutoComplPop'

" 補完 neocomplcache.vim : 究極のVim的補完環境
NeoBundle 'Shougo/neocomplcache'

" rubyでrequire先を補完する
NeoBundle 'ujihisa/neco-ruby'

" A neocomplcache plugin for English, using look command
" NeoBundle 'ujihisa/neco-look'
" }}}

" github にあるプラグイン
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tyru/vim-altercmd'
NeoBundle 'davidoc/taskpaper.vim'

" vim-scripts プラグイン

NeoBundle 'Tagbar'
NeoBundle 'ctrlp.vim'
NeoBundle 'nerdtree-ack'

" github にないプラグイン


" rubyまわりのインストール
" http://qiita.com/puriketu99/items/1c32d3f24cc2919203eb
" http://qiita.com/alpaca_taichou/items/ab2ad83ddbaf2f6ce7fb
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

if has("lua")
  NeoBundleLazy 'Shougo/neocomplete', { 'autoload' : {
        \   'insert' : 1,
        \ }}
endif

NeoBundleLazy 'Shougo/neosnippet', {
      \ 'autoload' : {
      \   'commands' : ['NeoSnippetEdit', 'NeoSnippetSource'],
      \   'filetypes' : 'snippet',
      \   'insert' : 1,
      \   'unite_sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
      \ }}

NeoBundle 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}

NeoBundleLazy 'alpaca-tc/vim-endwise.git', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}

NeoBundleLazy 'edsono/vim-matchit', { 'autoload' : {
      \ 'filetypes': 'ruby',
      \ 'mappings' : ['nx', '%'] }}

NeoBundleLazy 'ecomba/vim-ruby-refactoring'

NeoBundleLazy 'basyura/unite-rails', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \   'unite_sources' : [
      \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
      \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
      \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
      \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
      \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
      \     'rails/stylesheet', 'rails/view'
      \   ]
      \ }}

NeoBundleLazy 'taka84u9/vim-ref-ri', {
      \ 'depends': ['Shougo/unite.vim', 'thinca/vim-ref'],
	  \ 'autoload': { 'filetypes': 'ruby' }}

NeoBundleLazy 'alpaca-tc/neorspec.vim', {
      \ 'depends' : ['alpaca-tc/vim-rails', 'tpope/vim-dispatch'],
      \ 'autoload' : {
      \   'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
      \ }}

NeoBundle 'AndrewRadev/switch.vim'
" =============================


" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------



 " ファイル形式検出、プラグイン、インデントを ON
 filetype plugin indent on 

"syntax enable
syntax on

"colorscheme solarized
"colorscheme molokai
colorscheme jellybeans


if &term == "xterm"
  let &t_SI = &t_SI . "\e[?2004h"
  let &t_EI = "\e[?2004l" . &t_EI
  let &pastetoggle = "\e[201~"
       
  function XTermPasteBegin(ret)
  set paste
  return a:ret
  endfunction
		    
  imap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

set fileencoding=utf-8
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set paste
set backspace=indent,eol,start
set incsearch
set hlsearch
set ignorecase
set number
set smartindent
set autoindent

"Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

"カーソルキーで行末／行頭の移動可能に設定。
set whichwrap=b,s,[,],<,>
nnoremap h <Left>
nnoremap l <Right>
"l を <Right>に置き換えて、折りたたみを l で開くことができるようにする。
if has('folding')
  nnoremap <expr> l foldlevel(line('.')) ? "\<Right>zo" : "\<Right>"
endif

nnoremap s<Left> <C-w>h:call <SID>good_width()<Cr>
nnoremap s<Down> <C-w>j
nnoremap s<Up> <C-w>k
nnoremap s<Right> <C-w>l:call <SID>good_width()<Cr>
nnoremap sH <C-w>H:call <SID>good_width()<Cr>
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L:call <SID>good_width()<Cr>
function! s:good_width()
  if winwidth(0) < 84
    vertical resize 84
  endif
endfunction

"<C-e>でNERDTreeをオンオフ。いつでもどこでも。
"	map <silent> <C-e>   :NERDTreeToggle<CR>
"	lmap <silent> <C-e>  :NERDTreeToggle<CR>
	nmap <silent> <C-e>      :NERDTreeToggle<CR>
	vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
	omap <silent> <C-e>      :NERDTreeToggle<CR>
	imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
	cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
"他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
"How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

":Rename newfile で名前を変更可能に
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))


"<F8> 保存→ rubyで実行
nmap <F8> :w<CR>:!ruby %<CR>

"ruby周りの設定

"==switch.vim==
function! s:separate_defenition_to_each_filetypes(ft_dictionary) "{{{
  let result = {}
 
  for [filetypes, value] in items(a:ft_dictionary)
    for ft in split(filetypes, ",")
      if !has_key(result, ft)
        let result[ft] = []
      endif
 
      call extend(result[ft], copy(value))
    endfor
  endfor
 
  return result
endfunction"}}}
 
" ------------------------------------
" switch.vim
" ------------------------------------
nnoremap ! :Switch<CR>
let s:switch_definition = {
      \ '*': [
      \   ['is', 'are']
      \ ],
      \ 'ruby,eruby,haml' : [
      \   ['if', 'unless'],
      \   ['while', 'until'],
      \   ['.blank?', '.present?'],
      \   ['include', 'extend'],
      \   ['class', 'module'],
      \   ['.inject', '.delete_if'],
      \   ['.map', '.map!'],
      \   ['attr_accessor', 'attr_reader', 'attr_writer'],
      \ ],
      \ 'Gemfile,Berksfile' : [
      \   ['=', '<', '<=', '>', '>=', '~>'],
      \ ],
      \ 'ruby.application_template' : [
      \   ['yes?', 'no?'],
      \   ['lib', 'initializer', 'file', 'vendor', 'rakefile'],
      \   ['controller', 'model', 'view', 'migration', 'scaffold'],
      \ ],
      \ 'erb,html,php' : [
      \   { '<!--\([a-zA-Z0-9 /]\+\)--></\(div\|ul\|li\|a\)>' : '</\2><!--\1-->' },
      \ ],
      \ 'rails' : [
      \   [100, ':continue', ':information'],
      \   [101, ':switching_protocols'],
      \   [102, ':processing'],
      \   [200, ':ok', ':success'],
      \   [201, ':created'],
      \   [202, ':accepted'],
      \   [203, ':non_authoritative_information'],
      \   [204, ':no_content'],
      \   [205, ':reset_content'],
      \   [206, ':partial_content'],
      \   [207, ':multi_status'],
      \   [208, ':already_reported'],
      \   [226, ':im_used'],
      \   [300, ':multiple_choices'],
      \   [301, ':moved_permanently'],
      \   [302, ':found'],
      \   [303, ':see_other'],
      \   [304, ':not_modified'],
      \   [305, ':use_proxy'],
      \   [306, ':reserved'],
      \   [307, ':temporary_redirect'],
      \   [308, ':permanent_redirect'],
      \   [400, ':bad_request'],
      \   [401, ':unauthorized'],
      \   [402, ':payment_required'],
      \   [403, ':forbidden'],
      \   [404, ':not_found'],
      \   [405, ':method_not_allowed'],
      \   [406, ':not_acceptable'],
      \   [407, ':proxy_authentication_required'],
      \   [408, ':request_timeout'],
      \   [409, ':conflict'],
      \   [410, ':gone'],
      \   [411, ':length_required'],
      \   [412, ':precondition_failed'],
      \   [413, ':request_entity_too_large'],
      \   [414, ':request_uri_too_long'],
      \   [415, ':unsupported_media_type'],
      \   [416, ':requested_range_not_satisfiable'],
      \   [417, ':expectation_failed'],
      \   [422, ':unprocessable_entity'],
      \   [423, ':precondition_required'],
      \   [424, ':too_many_requests'],
      \   [426, ':request_header_fields_too_large'],
      \   [500, ':internal_server_error'],
      \   [501, ':not_implemented'],
      \   [502, ':bad_gateway'],
      \   [503, ':service_unavailable'],
      \   [504, ':gateway_timeout'],
      \   [505, ':http_version_not_supported'],
      \   [506, ':variant_also_negotiates'],
      \   [507, ':insufficient_storage'],
      \   [508, ':loop_detected'],
      \   [510, ':not_extended'],
      \   [511, ':network_authentication_required'],
      \ ],
      \ 'rspec': [
      \   ['describe', 'context', 'specific', 'example'],
      \   ['before', 'after'],
      \   ['be_true', 'be_false'],
      \   ['get', 'post', 'put', 'delete'],
      \   ['==', 'eql', 'equal'],
      \   { '\.should_not': '\.should' },
      \   ['\.to_not', '\.to'],
      \   { '\([^. ]\+\)\.should\(_not\|\)': 'expect(\1)\.to\2' },
      \   { 'expect(\([^. ]\+\))\.to\(_not\|\)': '\1.should\2' },
      \ ],
      \ 'markdown' : [
      \   ['[ ]', '[x]']
      \ ]
      \ }

let s:switch_definition = s:separate_defenition_to_each_filetypes(s:switch_definition)
function! s:define_switch_mappings() "{{{
  if exists('b:switch_custom_definitions')
    unlet b:switch_custom_definitions
  endif
 
  let dictionary = []
  for filetype in split(&ft, '\.')
    if has_key(s:switch_definition, filetype)
      let dictionary = extend(dictionary, s:switch_definition[filetype])
    endif
  endfor
 
  if exists('b:rails_root')
    let dictionary = extend(dictionary, s:switch_definition['rails'])
  endif
 
  if has_key(s:switch_definition, '*')
    let dictionary = extend(dictionary, s:switch_definition['*'])
  endif
 
  if !empty('dictionary')
"    switch_let('b','switch_custom_definitions', dictionary)
    let b:switch_custom_definitions = dictionary
  endif
endfunction "}}}
 
augroup SwitchSetting
  autocmd!
  autocmd Filetype * if !empty(split(&ft, '\.')) | call <SID>define_switch_mappings() | endif
augroup END

"====
"------------------------------------
" neosnippet
"------------------------------------
" neosnippet "{{{
 
" snippetを保存するディレクトリを設定してください
" example
" let s:default_snippet = neobundle#get_neobundle_dir() . '/neosnippet/autoload/neosnippet/snippets' " 本体に入っているsnippet
" let s:my_snippet = '~/snippet' " 自分のsnippet
" let g:neosnippet#snippets_directory = s:my_snippet
" let g:neosnippet#snippets_directory = s:default_snippet . ',' . s:my_snippet

"let s:default_snippet = neobundle#get_neobundle_dir() . '/neosnippet/autoload/neosnippet/snippets' " 本体に入っているsnippet
let s:my_snippet = '~/snippets' " 自分のsnippet
let g:neosnippet#snippets_directory = s:my_snippet
let g:neosnippet#snippets_directory = s:my_snippet
imap <silent><C-F>                <Plug>(neosnippet_expand_or_jump)
nnoremap <silent><Space>e         :<C-U>NeoSnippetEdit -split<CR>
smap <silent><C-F>                <Plug>(neosnippet_expand_or_jump)
" xmap <silent>o                    <Plug>(neosnippet_register_oneshot_snippet)
"}}}

" c*でカーソル下のキーワードを置換
nnoremap <expr> c* ':%s ;\<' . expand('<cword>') . '\>;'
vnoremap <expr> c* ':s ;\<' . expand('<cword>') . '\>;'

"CSVの列抜き出し
function! GetCsvCol(n)
  let linenum = 1
  for aline in getbufline(".",1,"$")
    call setline(linenum,split(aline,",")[a:n])
    let linenum=linenum+1
  endfor
endfunction

function! GetTsvCol(...)
  let linenum = 1
  for aline in getbufline(".",1,"$")
    let cols=split(aline,"\t")
    let selcols=[]
    for selcolnum in a:000
      call add(selcols,cols[selcolnum])
    endfor
    call setline(linenum,join(selcols,"\t"))
    let linenum=linenum+1
  endfor
endfunction

"crossbridge用
let g:syntastic_c_compiler_options='-I ~/crossbridge/sdk/usr/include'

