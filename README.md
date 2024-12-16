# Managing Dotfiles with Nix

Managing dotfiles across different systems can be tricky. This repo demonstrates how to use Nix (with flake) to handle dotfiles in a way that's easy to manage and works on various systems like NixOS, macOS, and Windows Subsystem for Linux (WSL).

## Why Use Nix?

Nix offers a different way to manage software and system settings. It provides:

- **Consistency**: Keeps your settings the same across all your systems.
- **No Conflicts**: Avoids issues with different software versions.
- **Flexibility**: Lets you organize settings into parts you can reuse.

And the most important thing: you can leverage the biggest reusable configuration repository in the world: [Nixpkgs](https://github.com/NixOS/nixpkgs) to make your life easier. E.g. to setup a self-hosted Jellyfin server, maybe all you need to do is add this to your configuration:

```nix
services.jellyfin.enable = true;
```

## How the Repository is Organized

Here's how it's laid out:

| Folder      | Subfolder/Files              | Description                                                                                                                                                                                       |
|-------------|------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `flake.nix` |                              | Entry point of the repo, loads configuration for each host from `hosts/*`. Uses different sources for different instances: latest NixOS unstable for workstations and stable release for servers. |
| `config/`   |                              | Contains static settings for apps like SSH and Vim. Uses Nix function `builtins.readFile` to read these files for configuration.                                                                  |
| `home/`     | `features/`                  | Modules for tools and apps (e.g., `git` settings in `features/cli/git.nix`).                                                                                                                      |
|             | `flavors/`                   | Pre-made setups like minimal or development environments, usually a combination of `features`.                                                                                                    |
| `hosts/`    | `desktop-nixos-workstation/` | Main setup for a NixOS desktop.                                                                                                                                                                   |
|             | `laptop-macos-work/`         | MacBook setup using home-manager.                                                                                                                                                                 |
|             | `laptop-nixos-aha/`          | NixOS laptop setup.                                                                                                                                                                               |
|             | `laptop-wsl-windows/`        | WSL setup using home-manager.                                                                                                                                                                     |
|             | `server-nixos-gateway/`      | NixOS server setup.                                                                                                                                                                               |
| `lib/`      |                              | Common Nix functions and tools, including a simple SSH function to read all `.pub` files in a directory.                                                                                          |
| `nixos/`    | `features/`                  | Individual NixOS features like services/applications/cli.                                                                                                                                         |
|             | `flavors/`                   | Pre-made NixOS setups for different needs, usually a combination of `features` + specific settings.                                                                                               |
|             | `hardware/`                  | Settings for specific hardware like GPUs.                                                                                                                                                         |
|             | `modules/`                   | Custom NixOS modules for extra features.                                                                                                                                                          |
| `overlays/` |                              | Custom package overlays for Nixpkgs, e.g., `mkLinuxOnly` function for importing Linux-only packages.                                                                                              |
| `pkgs/`     |                              | Custom package definitions for software not in the standard Nix repositories.                                                                                                                     |

## How I'm Using This

I'm using this structure to manage most of my devices which include x86 desktops/laptops, Windows WSL, Apple Silicon Macs, x86 servers, etc. there is usually what I do:

### First Setup Only

1. Install NixOS or nix + standalone Home-Manager for non-NixOS. Enable flake.
2. Clone this repository.
3. Add new hosts to `hosts/*` and adjust the settings.
4. Run the installation script:
   ```bash
   ./install.sh
   ```

### For NixOS Devices

Just run `nixos-rebuild switch` to apply the configuration.

### For Non-NixOS Devices

Run `home-manager switch` to apply the configuration.

---

I really hope this guide helps you manage your dotfiles or organize your nix configuration more easily. Happy Nixing!
