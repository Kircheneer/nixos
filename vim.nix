with import <nixpkgs> {};

vim_configurable.customize {
    name = "vim";
    vimrcConfig.customRC = ''
        set number
        syntax enable
        color desert
    '';
}
