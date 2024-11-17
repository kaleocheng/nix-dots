{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
    extraConfig = (builtins.readFile ../../../config/vim/vimrc);
    plugins = [
      #####START########
      # plugin for file tree
      ##################
      pkgs.vimPlugins.nerdtree
      #####END##########

      #####START########
      # plugin for editing
      ##################
      {
        plugin = pkgs.vimPlugins.supertab;
        config = "let g:SuperTabDefaultCompletionType = '<c-n>'";
      }
      pkgs.vimPlugins.auto-pairs
      pkgs.vimPlugins.vim-better-whitespace
      pkgs.vimPlugins.goyo-vim
      {
        plugin = pkgs.vimPlugins.limelight-vim;
        config = ''
          let g:limelight_conceal_ctermfg = 'gray'
          autocmd! User GoyoEnter Limelight
          autocmd! User GoyoLeave Limelight!
        '';
      }
      #####END##########

      #####START########
      # plugin for searching
      ##################
      {
        plugin = pkgs.vimPlugins.fzf-vim;
        config = "nnoremap <C-p> :Files<CR>";
      }
      #####END##########

      #####START########
      # plugin for MISC
      ##################
      pkgs.vimPlugins.vim-css-color
      {
        plugin = pkgs.vimPlugins.vim-startify;
        config = "let g:startify_change_to_vcs_root = 0";
      }
      {
        plugin = pkgs.vimPlugins.vim-floaterm;
        config = ''
          let g:floaterm_keymap_toggle = '<C-/>'
          cnoreabbrev Term FloatermToggle
        '';
      }

      #####END##########

      #####START########
      # plugin for git
      ##################
      # show status line
      pkgs.vimPlugins.vim-airline

      # show git branch info
      pkgs.vimPlugins.vim-fugitive

      # show git info in file tree
      {
        plugin = pkgs.vimPlugins.nerdtree-git-plugin;
        # autocmd bufenter is to close nerdtree when close a file
        config = ''
          let NERDTreeShowHidden=1
          map <C-n> :NERDTreeToggle<CR>
          autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        '';
      }

      # show git diff info
      pkgs.vimPlugins.vim-gitgutter
      #####END##########

      #####START########
      # plugin for markdown
      ##################
      {
        plugin = pkgs.vimPlugins.vim-table-mode;
        config = "let g:table_mode_corner='|'";
      }
      #####END##########
    ];
  };
  home.packages = with pkgs; [
    xclip # for clipboard
  ];
}
