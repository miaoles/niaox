{ niaox, pkgs, lib, config, ... }:

let
      odin-iao = pkgs.callPackage ../../packages/odin-iao { };
      ols-iao = pkgs.callPackage ../../packages/ols-iao { };

      vscodeSettingsUpdater = import ./vscode/settings-updater.nix { inherit config pkgs lib; };
in
{
      home = {
            packages = with pkgs; [
                  odin-iao #pkgs.odin
                  ols-iao #pkgs.ols
                  llvm
                  clang
                  SDL2
                  glfw
                  #raylib
                  renderdoc
                  vulkan-tools
                  vulkan-headers
                  vulkan-loader
                  vulkan-extension-layer
                  vulkan-validation-layers
                  vulkan-utility-libraries
                  glm
                  glibc
                  shaderc
            ];
            sessionVariables = {
                  odin = "ODIN_ROOT=${odin-iao}/share odin";
            };
      };

      programs.vscode =
            if niaox.user.editor == "vscode" then {
                  imports = [
                        (vscodeSettingsUpdater.vscodeSettings {
                              settingsUpdates = {
                                    "ols.server.path" = "${ols-iao}/bin/ols";
                                    "[odin].collections" = [
                                          {
                                                "name" = "core";
                                                "path" = "${odin-iao}/share/core";
                                          }
                                          {
                                                "name" = "vendor";
                                                "path" = "${odin-iao}/share/vendor";
                                          }
                                    ];
                              };
                        })
                  ];
            } else { };

      bash.shellAliases = {
            #odin = "ODIN_ROOT=${odin-iao}/share odin";
      };
}
