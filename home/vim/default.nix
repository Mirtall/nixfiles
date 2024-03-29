{ pkgs, ... }: {
  imports = [
    ./coc-settings.nix
  ];

  programs.vim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      vim-fugitive
      vim-vinegar
      vim-airline
      vim-surround
      a-vim
      fzf-vim
      ale
      Coqtail

      # coc.nvim config
      coc-nvim
      coc-clangd # C/C++ lsp
      coc-pyright # Python stuffs
    ];

    settings = {
      background = "dark";
      expandtab = true;
      number = true;
      relativenumber = true;
      shiftwidth = 4;
      tabstop = 8;
    };

    extraConfig = ''
      let g:ale_disable_lsp = 1

      filetype indent plugin on

      set completeopt=longest,menuone,popuphidden
      set completepopup=highlight:NONE

      highlight Pmenu ctermbg=Black ctermfg=White
      highlight PmenuSel ctermbg=Black ctermfg=LightBlue

      let maplocalleader = "\\"
      let mapleader = ","
      let $MYVIMRC = "~/nixfiles/vim.nix"
      set encoding=utf-8 fileencodings=
      syntax on

      inoremap ( ()<Esc>i
      inoremap { {}<Esc>i
      inoremap {<CR> {<CR>}<Esc>O
      inoremap [ []<Esc>i
      inoremap " ""<Esc>i
      inoremap ' '''<Esc>i
      noremap - ddp
      noremap _ ddkP
      inoremap <c-u> <Esc>bveUea
      nnoremap <c-U> vA<Esc>U<esc>
      nnoremap <leader>ev :vs $MYVIMRC<cr>
      nnoremap <leader>ss :A<cr>
      nnoremap <leader>es :Rg<cr>
      nnoremap <leader>gd :ALEGoToDefinition<cr>

      set cc=80
      set cinoptions+=:0
      set softtabstop=4
      set smarttab
      set smartindent
      set textwidth=80
      set backspace=eol,start,indent
      set clipboard=unnamedplus
      set belloff=all
      set list listchars=tab:»·,trail:·

      " Make configuration
      autocmd Filetype make setlocal noexpandtab

      " C++ shortcut
      autocmd Filetype cpp iabbrev cout std::cout
      autocmd Filetype cpp iabbrev cin std::cin
      autocmd Filetype cpp iabbrev cerr std::cerr
      autocmd Filetype cpp iabbrev clog std::clog

      " ALE configuration
      let g:ale_lint_on_enter = 0
      let g:ale_lint_on_text_changed = 'never'
      let g:ale_lint_on_insert_leave = 0
      let g:ale_fix_on_save = 1
      let g:ale_linters = {
      \  'c': ['clangd'],
      \ 'cpp': ['clangd'],
      \}

      let g:ale_fixers = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'c': ['clang-format'],
      \  'cpp': ['clang-format'],
      \  'nix': ['nixpkgs-fmt'],
      \}

      " a.vim config
      let g:alternateExtensions_cc = "hh"
      let g:alternateExtensions_hh = "cc"
      let g:alternateExtensions_hxx = "hh"

      " Coc configuration
      inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ CheckBackspace() ? "\<TAB>" :
            \ coc#refresh()
      inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

      function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction

      " rainbow configuration
      let g:rainbow_active = 1

      " per .git vim configs
      " just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
      " change syntax settings for this repository
      let git_settings = system("git config --get vim.settings")
      if strlen(git_settings)
          exe "set" git_settings
      endif
    '';
  };
}
