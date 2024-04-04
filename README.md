# nix-dots
This boilerplate repository demonstrates a scalable and modular approach to managing dotfiles across diverse systems using Nix. It's designed as a template to showcase the organization and management of configurations for various environments including macOS on M1, Debian on laptops, and NixOS on desktops, all underpinned by the power and flexibility of Nix.

## Structure

- `config/`: Static configurations like Conky, Rofi, SSH, Vim, and XFCE.
- `flake.lock` & `flake.nix`: Defines the Nix environment in a reproducible manner, locking down versions for consistency.
- `home/`: Contains home-manager configurations, categorically organized into CLI tools, desktop enhancements, development setups, and fonts.
- `hosts/`: System-specific NixOS and home-manager configurations for different machines like desktops and laptops.
- `modules/`: Features custom Nix modules, providing personalized services and settings.
- `nixos/`: Hosts NixOS configurations, sorted by features like desktop, development, server, and system settings.
- `pkgs/`: Custom or overridden Nix packages specific to my needs, supplementing the default nixpkgs repository.

And in hosts:

- `desktop-main`: Configurations for my main desktop.
- `laptop-mbp-m1`: Configurations tailored for a MacBook Pro M1 with home-manager.
- `laptop-thinkpad-x61`: Configurations for a ThinkPad X61 laptop with Debian + home-manager.
- `live-desktop`: Configurations for a live desktop ISO image.
