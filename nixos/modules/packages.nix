{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bash
    cifs-utils
    curl
    gnome-keyring
    htop
    lvm2
    neovim
    nmap
    pipewire
    vim
    vlc
    wayland-utils
    wget
    wl-clipboard
    xfce.thunar
    xfce.thunar-volman
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-user-dirs
  ];
}
