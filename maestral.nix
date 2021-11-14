{ pgks, ... }:

let 
  variables = import ./variables.nix;
in {
  environment.etc."maestral/maestral.ini".text = ''
    [main]
    path = /home/leo/Maestral
    excluded_items = ['/dateianfragen', '/keys', '/apps', '/keepass', '/sent files', '/bilder', '/images', '/backups', '/videos', '/musik', '/leo kirchner', '/lizenzen', '/dokumente', '/brummi']
    version = 15.0.0
    
    [account]
    account_id = dbid:AABIAfFbBcXYQrb-SV0n6dWa8uNFIrJjEY8
    
    [app]
    notification_level = 15
    log_level = 20
    update_notification_interval = 604800
    keyring = keyrings.alt.file.PlaintextKeyring
    
    [sync]
    reindex_interval = 1209600
    max_cpu_percent = 20.0
    keep_history = 604800
    upload = True
  '';

  systemd.services.maestral = {
      wantedBy = [ "default.target" ]; 
      description = "Start the Maestral client.";
      serviceConfig = {
          Type = "notify";
          User = "leo";
          NotifyAccess = "exec";
          ExecStart = "/run/current-system/sw/bin/maestral start -f -c '/etc/maestral/maestral'";
          ExecStop = "/run/current-system/sw/bin/maestral stop";
          WatchdogSec = "30s";
      };
   };


}
