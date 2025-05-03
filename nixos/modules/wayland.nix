{ config, pkgs, ... }:

{
  services.xserver.enable = false; # Disable Xorg
  services.wayland.enable = true;  # Enable Wayland

  # Enable Hyprland as the Wayland compositor
  services.wayland.windowManager.hyprland.enable = true;

  # Optional: Set environment variables for Wayland
  environment.variables = {
    XDG_SESSION_TYPE = "wayland";
    MOZ_ENABLE_WAYLAND = "1"; # Enable Wayland support for Firefox
    QT_QPA_PLATFORM = "wayland"; # Enable Wayland support for Qt applications
  };
}