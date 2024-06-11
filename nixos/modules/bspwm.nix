{ pkgs, config, ... }:

{
      services.xserver.windowManager.bspwm = {
            enable = true;
            package = pkgs.bspwm;
            configFile = config.lib.file.mkOutOfStoreSymlink ../../../configurations/bspwm/bspwmrc;
      };
}
