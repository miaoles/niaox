{ niaox, pkgs, ... }:

{
      nix.settings.trusted-users = [
            "root"
            "@wheel"
      ];

      home-manager.useUserPackages = true;
      home-manager.useGlobalPkgs = true;

      users.users = {
            "${niaox.user.username}" = {
                  isNormalUser = true;
                  extraGroups = [
                        "wheel"
                        "sudo"
                        "audio"
                        "video"
                        "networkmanager"
                        "netdev"
                        "libvirtd"
                        "docker"
                  ];
                  home = niaox.user.homeDirectory;
                  shell = pkgs.bash;
            };
      };
}
