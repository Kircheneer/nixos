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
      "/var/log"
      "/home/leo/Pictures"
      "/home/leo/.mozilla"
      "/home/leo/.local/share/fish"
      # PyCharm
      "/home/leo/.config/JetBrains"
      "/home/leo/.cache/JetBrains"
      "/home/leo/.local/share/JetBrains"
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
