{ pkgs, ... }:
{
  users.users.pd = {
    home = "/Users/pd";
    shell = pkgs.zsh;
  };
}
