{ config, pkgs, ... }:

{
  hardware.pulseaudio.enable = false;
  hardware.pulseaudio.support32Bit = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
}
