{ pkgs, ... }:

{
      programs = {
            steam = {
                  enable = true;
                  protontricks.enable = true;
                  gamescopeSession.enable = true;
                  extraCompatPackages = [
                        pkgs.proton-ge-bin
                  ];
            };

            gamemode = {
                  enable = true;
                  enableRenice = true;
                  settings = {
                        general = {
                              reaper_freq = 5;
                              renice = 20;
                              desiredgov = "performance";
                              softrealtime = "auto";
                              ioprio = 0;
                              inhibit_screensaver = 1;
                              disable_splitlock = 1;
                        };

                        gpu = {
                              apply_gpu_optimisations = "accept-responsibility";
                              gpu_device = 0;
                              amd_performance_level = "high";
                        };
                  };
            };
      };
}
