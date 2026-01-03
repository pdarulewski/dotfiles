{...}: {
  programs.ripgrep = {
    enable = true;

    arguments = [
      "--hidden"
      "--glob=!.git/*"
      "--glob=!*.lock"
      "--glob=!*.gen.*"
    ];
  };
}
