{ pkgs, config, ... }:

{
      services.xserver.windowManager.bspwm.sxhkd = {
            package = pkgs.sxhkd;
            configFile = config.lib.file.mkOutOfStoreSymlink ../../../configurations/sxhkd/sxhkdrc;
      };
}
