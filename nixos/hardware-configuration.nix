{ config, pkgs, ... }:

{
  # Basic hardware configuration
  boot = {
    # Uncomment for desktops
    #kernelParams = ["nohibernate"];
    tmp.cleanOnBoot = true;
    supportedFilesystems = ["ntfs"];
    loader = {
        efi.canTouchEfiVariables = true;
        grub = {
        device = "nodev";
        efiSupport = true;
        enable = true;
        useOSProber = false;
        timeoutStyle = "menu";
        };
        timeout = 5;
    };
  };

  # Intel CPU microcode
  hardware.cpu.intel.updateMicrocode = true;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/YOUR-ROOT-UUID";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/YOUR-BOOT-UUID";
    fsType = "vfat";
  };

# Uncomment and set the UUID for your home partition if you have one
  #fileSystems."/home" = {
  #device = "/dev/disk/by-uuid/YOUR-HOME-UUID";
  #fsType = "ext4";
  #};

  # CIFS mounts
  fileSystems."/mnt/nas" = {
    device = "//10.2.0.12/Alexander";
    fsType = "cifs";
    options = [ "rw" "uid=1000" "gid=100" "file_mode=0666" "dir_mode=0777" "username=alexander" "password=your-password" ];
  };

  fileSystems."/mnt/ISOs" = {
    device = "//10.2.0.12/ISOs";
    fsType = "cifs";
    options = [ "rw" "uid=1000" "gid=100" "file_mode=0666" "dir_mode=0777" "username=alexander" "password=your-password" ];
  };

  fileSystems."/mnt/plex" = {
    device = "//10.2.0.5/Media";
    fsType = "cifs";
    options = [ "rw" "uid=1000" "gid=100" "file_mode=0666" "dir_mode=0777" "username=alexander" "password=your-password" ];
  };

  fileSystems."/mnt/mediabox" = {
    device = "//10.2.0.120/media";
    fsType = "cifs";
    options = [ "rw" "uid=1000" "gid=100" "file_mode=0666" "dir_mode=0777" "username=alexander" "password=your-password" ];
  };
}