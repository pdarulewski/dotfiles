{...}: {
  programs.atuin = {
    enable = true;

    enableZshIntegration = false;

    settings = {
      auto_sync = false;
      enter_accept = true;
      filter_mode_shell_up_key_binding = "directory";
      keymap_mode = "vim-normal";
      keys = {
        scroll_exits = false;
      };
    };
  };
}
