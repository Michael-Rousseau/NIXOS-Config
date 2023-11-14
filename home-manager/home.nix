{
    pkgs,
    ...
}:
let
    username="tayron";
    wallpaper = ../../wallpapers/wallpaper.jpg;
    dmenuCommand = "${pkgs.rofi}/bin/rofi -modi drun,run -show drun";
    lockCommand = "${pkgs.betterlockscreen}/bin/betterlockscreen --lock";
    terminal = "${pkgs.alacritty}/bin/alacritty";
in {
    imports = [

        (import ../modules/zsh {
            withKubernetes = true;  
        })
        (import ../modules/i3 {
            inherit lockCommand dmenuCommand wallpaper terminal;
            i3pkg = pkgs.i3-gaps;
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-default.toml";
        })
        ../modules/alacritty
        (import ../modules/i3status-rust {
            battery = true;
            netDevice = "enp60s0";
        })
        (import ../modules/rofi {
            inherit terminal;
        })
        (import ../modules/git {
            userName = "Michael-Rousseau";
            userEmail = "michael.rousseau@epita.fr";
        })
    ];
    home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        packages = with pkgs; [
            krb5
            sshfs

            poetry

            # LspServer
            rust-analyzer
            clang-tools

            discord
            teams
            slack

            firefox

            imagemagick
        ];
    };

    
    home.stateVersion = "23.05";

   programs.home-manager.enable = true;
   programs.vscode = {
     enable = true;
     extensions = with pkgs.vscode-extensions; [
       dracula-theme.theme-dracula
       vscodevim.vim
       yzhang.markdown-all-in-one
     ];
     

   };
 }
