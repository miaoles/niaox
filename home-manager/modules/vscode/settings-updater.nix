{ pkgs, config, lib, ... }:

let
      settingsFile = ../../configurations/vscode/settings.json;

      vscodeSettingsUpdate = settingsUpdates:
            let
                  settingsCurrent = builtins.fromJSON (builtins.readFile settingsFile);
                  settingsUpdated = settingsCurrent // settingsUpdates;

                  settingsUpdateScript = pkgs.writeShellScriptBin "update-vscode-settings-script" ''
                        cp ${settingsFile} ${settingsFile}.bak
                        echo '${builtins.toJSON settingsUpdated}' > ${settingsFile}
                  '';
            in
            {
                  script = settingsUpdateScript;
                  settings = settingsUpdated;
            };
in
{
      vscodeSettings = { settingsUpdates }:
            let
                  result = vscodeSettingsUpdate settingsUpdates;
            in
            {
                  environment.systemPackages = [ result.script ];
                  system.activationScripts.updateVscodeSettings = lib.stringAfter [ "writeBoundary" ] ''
                        ${result.script}/bin/update-vscode-settings-script
                  '';
            };

      programs.vscode.userSettings = config.lib.mkOutOfStoreSymlink settingsFile;
}
