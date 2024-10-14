{
  enable = true;

  font = {
    size = 10;
    name = "Fira Code";
  };

  extraConfig = ''
    disable_ligatures     cursor
    bold_font             auto
    italic_font           Victor Mono
    bold_italic_font      Victor Mono
    adjust_line_height    15

    cursor_blink_interval 0
    macos_option_as_alt   left

    background_opacity          1
    hide_window_decorations     titlebar-only
    window_padding_width        10

    # kitty-scrollback.nvim Kitten alias
    action_alias kitty_scrollback_nvim kitten /Users/pd/.local/share/nvim/lazy/kitty-scrollback.nvim/python/kitty_scrollback_nvim.py

    # Browse scrollback buffer in nvim
    map kitty_mod+h kitty_scrollback_nvim

    # Browse output of the last shell command in nvim
    map kitty_mod+g kitty_scrollback_nvim --config ksb_builtin_last_cmd_output

    # Show clicked command output in nvim
    mouse_map ctrl+shift+right press ungrabbed combine : mouse_select_command_output : kitty_scrollback_nvim --config ksb_builtin_last_visited_cmd_output

    # Seti-UI + Custom
    symbol_map U+E5FA-U+E62B Symbols Nerd Font Mono

    # Devicons
    symbol_map U+E700-U+E7C5 Symbols Nerd Font Mono

    # Font Awesome
    symbol_map U+F000-U+F2E0 Symbols Nerd Font Mono

    # Font Awesome Extension
    symbol_map U+E200-U+E2A9 Symbols Nerd Font Mono

    # Material Design Icons
    symbol_map U+F500-U+FD46 Symbols Nerd Font Mono

    # Weather
    symbol_map U+E300-U+E3EB Symbols Nerd Font Mono

    # Octicons
    symbol_map U+F400-U+F4A8,U+2665,U+26A1,U+F27C Symbols Nerd Font Mono

    # Powerline Extra Symbols
    symbol_map U+E0A3,U+E0B4-U+E0C8,U+E0CC-U+E0D2,U+E0D4 Symbols Nerd Font Mono

    # IEC Power Symbols
    symbol_map U+23FB-U+23FE,U+2b58 Symbols Nerd Font Mono

    # Font Logos
    symbol_map U+F300-U+F313 Symbols Nerd Font Mono

    # Pomicons
    symbol_map U+E000-U+E00D Symbols Nerd Font Mono

    foreground              #959dcb
    background              #24273A

    selection_foreground    #eceef0
    selection_background    #18354f

    cursor_text_color       #292d3e
    cursor                  #ffcc00

    # black
    color0                  #292d3e
    color8                  #7f849a

    # red
    color1                  #f07178
    color9                  #ff8b92

    # green
    color2                  #89ffe2
    color10                 #c0ffef

    # yellow
    color3                  #ffcc00
    color11                 #ffdd57

    # blue
    color4                  #82aaff
    color12                 #9cc4ff

    # magenta
    color5                  #c792ea
    color13                 #e1acff

    # cyan
    color6                  #89ddff
    color14                 #a3f7ff

    # white
    color7                  #d0d0d0
    color15                 #fefefe

    url_color               #73daca
  '';
}
