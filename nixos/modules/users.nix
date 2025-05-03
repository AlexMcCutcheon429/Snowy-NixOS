{ config, pkgs, ... }:

{
  users.users.alexander = {
    isNormalUser = true;
    home = "/home/alexander";
    shell = pkgs.bash;
    extraGroups = [
        "flatpak"
        "disk"
        "qemu"
        "kvm"
        "libvirtd"
        "sshd"
        "networkmanager"
        "wheel"
        "audio"
        "video"
        "root"
    ];
  };

  # Allow members of the wheel group to use sudo
  security.sudo = {
    enable = true;
    wheelNeedsPassword = true; # Require password for sudo
  };
}