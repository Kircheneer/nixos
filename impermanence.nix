{ ... }:

let
  impermanence = builtins.fetchTarball {
    url =
      "https://github.com/nix-community/impermanence/archive/master.tar.gz";
  };
in {
  # Import the nixos module.
  imports = [ "${impermanence}/nixos.nix" ];

  environment.persistence."/nix/persist" = {
    directories = [
      "/etc/nixos"
      "/etc/maestral"
      "/var/log"
      "/home/leo/Maestral"
      "/home/leo/Pictures"
      "/home/leo/git"
      "/home/leo/.mozilla"
      "/home/leo/.cache"
      "/home/leo/.local/share/fish"
      "/home/leo/.local/share/maestral"
      "/home/leo/.local/share/python_keyring"
      "/home/leo/.config/maestral"
      "/home/leo/.config/obsidian"
      "/home/leo/.config/Slack"
      "/home/leo/.thunderbird"
      "/home/leo/.config/keepassxc"
      # PyCharm
      "/home/leo/.config/JetBrains"
      "/home/leo/.cache/JetBrains"
      "/home/leo/.local/share/JetBrains"
      "/home/leo/.java/userPrefs"
    ];
    files = [
      "/etc/machine-id"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
    ];
  };
}
