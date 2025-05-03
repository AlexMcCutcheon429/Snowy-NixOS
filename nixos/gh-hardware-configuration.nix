{ config, pkgs, lib, ... }:

{
  # Basic hardware configuration
  boot = {
    # Uncomment for desktops
    #kernelParams = ["nohibernate"];
    kernelModules = ["kvm-intel"]; 
    tmp.cleanOnBoot = true;
    supportedFilesystems = ["ntfs"];
    extraModulePackages = [ ];
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
    initrd = {
	availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
	kernelModules = [ ];
    };
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
    options = [ "rw" "uid=1000" "gid=100" "file_mode=0666" "dir_mode=0777" "username=alexander" "password=AM.Securepass1" ];
  };

  fileSystems."/mnt/ISOs" = {
    device = "//10.2.0.12/ISOs";
    fsType = "cifs";
    options = [ "rw" "uid=1000" "gid=100" "file_mode=0666" "dir_mode=0777" "username=alexander" "password=AM.Securepass1" ];
  };

  fileSystems."/mnt/plex" = {
    device = "//10.2.0.5/Media";
    fsType = "cifs";
    options = [ "rw" "uid=1000" "gid=100" "file_mode=0666" "dir_mode=0777" "username=alexander" "password=Contented8-Bungee-Dubbed" ];
  };

#  fileSystems."/mnt/mediabox" = {
#    device = "//10.2.0.120/media";
#    fsType = "cifs";
#    options = [ "rw" "uid=1000" "gid=100" "file_mode=0666" "dir_mode=0777" "username=alexander" "password=Flatly-Barometer-Manila-7" ];
#  };


  fileSystems."/" =
    { device = "/dev/disk/by-uuid/8ef1621b-d8cc-488e-af84-7738f5868410";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/DAA1-FA55";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };


  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = true; #lib.mkDefault config.hardware.enableRedistributableFirmware;
}
