{ ... }:

{
      services.xserver = {
            # AMD Graphics
            videoDrivers = [ "amdgpu" ];
            deviceSection = ''
                  Option "TearFree" "true"
                  Option "AsyncFlipSecondaries" "true"
            '';
      };
      hardware.opengl = {
            enable = true;

            #package = mesa.drivers;
            driSupport = true;

            #package32 = mesa.drivers;
            driSupport32Bit = true;

            #extraPackages = with unstable; [ mesa ];
            #extraPackages32 = with unstable; [ driversi686Linux.mesa ];
      };
}
