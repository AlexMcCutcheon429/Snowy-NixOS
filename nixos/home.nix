{ config, pkgs, ... }:

let 
    home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";

in
{
  imports = [
    (import "${home-manager}/nixos")
  ];
  home-manager.backupFileExtension = "true";
  home-manager.users.alexander = {
    home.stateVersion = "24.11"; # Adjust to match your NixOS version
    home.packages = with pkgs; [
      alacritty
      audacity
      bat
      discord
      dunst
      firefox
      gh
      git
      gnugrep
      gparted
      gimp
      google-chrome
      grim
      mangohud
      nomacs
      nwg-look
      pavucontrol
      plex-desktop
      prismlauncher
      protonup-qt
      libsForQt5.qt5ct
      qt6ct
      rofi-wayland
      slurp
      spotify
      steam
      syncthing
      tealdeer
      trash-cli
      unzip
      virt-viewer
      vscode
      waybar
      wl-clipboard
      zoxide

      # Coding and Development Dependencies
      dotnetCorePackages.dotnet_8.sdk
      dotnetCorePackages.dotnet_8.aspnetcore
      dotnetCorePackages.dotnet_8.runtime
      gnumake
      nodejs_22
      ninja
    ];
    programs.bash.enable = true;
    wayland.windowManager.hyprland = {
     enable = true;
     settings = {
     "$mod" = "SUPER";
     bind = [
     "$mod, B, exec, firefox"
     "$mod, RETURN, exec, alacritty"
    ];
    };
    };
  };
}
