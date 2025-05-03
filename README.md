My personal nix configuration

- configuration.nix
    - The main configuration file. Imports the other files into it
- hardware-configuration.nix
    - This file controls the mountpoints and other hardware specific things that will change from system to system
- modules/
    - Subdirectory containing modular configs for each part of the system.