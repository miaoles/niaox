{ pkgs, ... }:

{
      # xanmod cacule kernel
      boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
}
