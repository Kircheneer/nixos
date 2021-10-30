{ pgks, ... }:

let 
  colors = import ./colors.nix;
in {
  environment.etc."kitty.conf".text = ''
    font_size 12.0

    background ${colors.colors.nord0}
    foreground ${colors.colors.nord4}
    selection_foreground ${colors.colors.nord3}
    selection_background ${colors.colors.nord6}
    url_color ${colors.colors.nord7}
    cursor ${colors.colors.nord8}

    color0 ${colors.colors.nord1}
    color1 ${colors.colors.nord11}
    color2 ${colors.colors.nord14}
    color3 ${colors.colors.nord13}
    color4 ${colors.colors.nord9}
    color5 ${colors.colors.nord15}
    color6 ${colors.colors.nord8}
    color7 ${colors.colors.nord5}
    color8 ${colors.colors.nord3}
    color9 ${colors.colors.nord11}
    color10 ${colors.colors.nord14}
    color11 ${colors.colors.nord13}
    color12 ${colors.colors.nord9}
    color13 ${colors.colors.nord15}
    color14 ${colors.colors.nord7}
    color15 ${colors.colors.nord6}
  '';
}
