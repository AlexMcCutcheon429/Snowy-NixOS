{ config, pkgs, lib, ... }:

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

time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    packages = [pkgs.terminus_font];
    font = "${pkgs.terminus_font}/share/consolefonts/ter-i22b.psf.gz";
    useXkbConfig = true;
  };


  system.stateVersion = "24.11";
}
