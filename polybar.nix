{ pgks, ... }:

let 
  variables = import ./variables.nix;
in {
  environment.etc."polybar.conf".text = ''
    [bar/default]
    modules_right = date

    [module/date]
    type = internal/date
    date = %d-%m-%Y%
  '';
}
