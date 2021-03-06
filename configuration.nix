{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./i3.nix
      ./i3status-rs.nix
      ./impermanence.nix
      ./kitty.nix
      ./maestral.nix
      ./home-manager.nix
    ];

  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  time.timeZone = "Europe/Berlin";

  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
  };

  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };
   
    displayManager = {
        defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      configFile = "/etc/i3.conf";
      extraPackages = with pkgs; [
        dmenu
        i3status-rust
        i3lock
        i3blocks
     ];
    };
  };

  # Configure keymap in X11
  services.xserver.layout = "de";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.picom.enable = true;
  virtualisation.docker.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.leo = {
    initialHashedPassword = "$6$u3pdfBgpjLx$xHhUMr3bvRGRcmOEjkn.6mXV1Up/Wvv7CfaSx8T8yFNtPUBuA3.LLFiqPL74e5WI3/VHRZg6pQEAjQtHc8jDt1";
    shell = pkgs.fish;
    isNormalUser = true;
    createHome = true;
    home = "/home/leo";
    extraGroups = [ "wheel" "docker" ];
  };

  programs.fish.enable = true;

  environment.variables = {
    KITTY_CONFIG_DIRECTORY = "/etc";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # terminal applications
    vim
    fish
    wget
    kitty
    git
    parted
    feh
    python38
    python38Packages.poetry
    htop
    # graphical applications
    firefox
    jetbrains.pycharm-community
    slack
    lxappearance
    keepassxc
    vscode-with-extensions
    obsidian
    thunderbird
    # system applications
    picom
    dropbox
    nordic
    dunst
    maestral
    libnotify
  ];

  fonts.fonts = with pkgs; [
    font-awesome
    font-awesome_4
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "21.05"; # Did you read the comment?
}

