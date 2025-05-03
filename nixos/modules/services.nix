{ config, pkgs, ... }:

{
  # Networking
  networking = {
    networkmanager.enable = true;
    firewall.enable = true;       # Enable a basic firewall
  };

  # Hardware
  hardware.bluetooth.enable = true; # Enable Bluetooth support

  # Services
  services = {
    openssh.enable = true;          # Enable OpenSSH for remote access
    timesyncd.enable = true;        # Enable systemd-timesyncd for time synchronization
    printing.enable = true;         # Enable CUPS for printing support
   # flatpak.enable = true;

    # Display Manager
    displayManager.sddm.wayland.enable = true;

    # Polkit
#    polkit = {
 #     enable = true;
  #    extraConfig = ''
   #     [Configuration]
   #     AdminIdentities=unix-group:wheel
   #   '';
   #   agent = {
   #     enable = true;
   #     package = pkgs.gnome-polkit; # Use GNOME Polkit agent
   #   };
   # };
  };
#  xdg.portal = {
#  enable = true;
#  extraPortals = ["xdg-desktop-portal-gtk"];
#  config.common = {
#  default = ["gtk"];
#};
#};
}
