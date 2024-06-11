{
      description = "niaox - iao Nix Configuration for NixOS and Home Manager";

      inputs = {
            nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

            home-manager = {
                  url = "github:nix-community/home-manager";
                  inputs.nixpkgs.follows = "nixpkgs";
            };
      };

      outputs = { self, nixpkgs, home-manager, ... }:
            let
                  niaox = {
                        hosts = {
                              desktop = {
                                    hostname = "iao";
                                    system = "x86_64-linux";
                                    locale = "en_US.UTF-8";
                                    timezone = "America/New York";
                                    dotsPerInch = "96";
                                    framesPerSecond = "170"; # Samsung Odyssey Neo G7
                                    desktopEnvironment = "lxqt";
                                    windowManager = "bspwm";
                              };
                        };
                        users = {
                              miles = {
                                    username = "miles";
                                    name = "Miles";
                                    homeDirectory = "/home/miles";
                                    email = "iao_mm@pm.me";
                                    terminal = "qterminal";
                                    editor = "vscode";
                                    webBrowser = "firefox";
                                    font = "Roboto";
                              };
                        };
                  };
            in
            {
                  /*
                  homeConfigurations."miles" = home-manager.lib.homeManagerConfiguration {
                        inherit niaox;
                        pkgs = import nixpkgs {
                              system = niaox.desktop.system;
                              config = {
                                    allowUnfree = true;
                              };
                        };

                        modules = [ ./home.nix ];
                  };
                  */
                  nixosConfigurations."iao" = nixpkgs.lib.nixosSystem {
                        system = niaox.hosts.desktop.system;
                        specialArgs = {
                              niaox = {
                                    host = niaox.hosts.desktop;
                                    user = niaox.users.miles;
                              };
                        };
                        modules = [
                              ./nixos/configuration.nix
                              home-manager.nixosModules.home-manager
                              ({ niaox, ... }: {
                                    home-manager.useGlobalPkgs = true;
                                    home-manager.users.${niaox.user.name} = import ./home-manager/home.nix;
                              })
                        ];
                  };
            };
}
