{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./home.nix
    ./modules/packages.nix
    ./modules/services.nix
    ./modules/sound.nix
    ./modules/users.nix
    ./modules/wayland.nix
  ];

  documentation.nixos.enable = false;

  nix = {
    settings = {
      warn-dirty = false;
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      substituters = ["https://nix-gaming.cachix.org"];
      trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
    };
  };

  nixpkgs.config.allowUnfree = true;

  kernelModules = ["tcp_bbr"];
  kernel.sysctl = {
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.core.default_qdisc" = "fq";
    "net.core.wmem_max" = 1073741824;
    "net.core.rmem_max" = 1073741824;
    "net.ipv4.tcp_rmem" = "4096 87380 1073741824";
    "net.ipv4.tcp_wmem" = "4096 87380 1073741824";
    };

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    packages = [pkgs.terminus_font];
    font = "${pkgs.terminus_font}/share/consolefonts/ter-i22b.psf.gz";
    useXkbConfig = true;
  };


  system.stateVersion = "25.05";
}