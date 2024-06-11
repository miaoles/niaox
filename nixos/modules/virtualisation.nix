{ pkgs, ... }:

{
      environment.systemPackages = with pkgs; [
            #virt-manager-qt
            virt-manager
            virt-viewer
            spice
            spice-gtk
            spice-protocol
            win-virtio
            win-spice
      ];

      programs.dconf.enable = true;

      virtualisation = {
            libvirtd = {
                  enable = true;

                  qemu = {
                        swtpm.enable = true;
                        ovmf.enable = true;
                        ovmf.packages = [ pkgs.OVMFFull.fd ];
                  };
            };

            spiceUSBRedirection.enable = true;

            docker.enable = true;
      };

      services.spice-vdagentd.enable = true;
}
