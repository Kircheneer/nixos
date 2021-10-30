{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./kitty.nix
    ];

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
      configFile = "/etc/i3.conf";
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
     ];
    };
  };

  environment.etc."i3.conf".text = pkgs.callPackage ./i3.nix {};

  # Configure keymap in X11
  services.xserver.layout = "de";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.leo = {
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  programs.fish.enable = true;

  environment.variables = {
    KITTY_CONFIG_DIRECTORY = "/etc";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    fish
    (import ./vim.nix)
    wget
    kitty
    firefox
    git
    parted
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "21.05"; # Did you read the comment?
}

