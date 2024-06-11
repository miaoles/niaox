{ pkgs, config, lib, ... }:

let
      nixpkgs-fmt-iao = pkgs.callPackage ../../../packages/nixpkgs-fmt-iao { };

      vscodeSettingsUpdater = import ./settings-updater.nix { inherit config pkgs lib; };
in
{
      imports = [
            (
                  vscodeSettingsUpdater.vscodeSettings {
                        settingsUpdates = {
                              "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
                              "nix.formatterPath" = "${nixpkgs-fmt-iao}/bin/nixpkgs-fmt";
                        };
                  }
            )
      ];
      home.packages = with pkgs; [
            nodePackages.vscode-json-languageserver
            nixd
            nixpkgs-fmt-iao #pkgs.nixpkgs-fmt
      ];

      programs.vscode = {
            enable = true;
            package = pkgs.vscodium;
      };
}
