{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.leo = {
    programs.git = {
      enable = true;
      userName  = "Leo Kirchner";
      userEmail = "leo@kirchne.red";
    };
    programs.vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [ vim-airline ];
      settings = { 
      };
      extraConfig = ''
        set number
        syntax enable
      '';
  };
  };
}
