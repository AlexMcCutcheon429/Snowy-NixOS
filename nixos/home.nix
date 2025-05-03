{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.alexander = {
    home.stateVersion = "25.05"; # Adjust to match your NixOS version
    home.packages = with pkgs; [
      alacritty
      audacity
      bat
      discord
      dunst
      firefox
      fuse-common
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
      qt5ct
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
      dotnetCorePackages.sdk_8
      dotnetCorePackages.dotnet_8.aspnetcore
      dotnetCorePackages.dotnet_8.runtime
      gnumake
      nodejs_22
      ninja
    ];
    programs.bash.enable = true;
  };

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;

  theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

  iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

  font = {
      name = "Sans";
      size = 11;
    };
  };
}