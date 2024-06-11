{ pkgs, ... }:

{
      networking.hostName = "iao"; # Define your hostname.

      #networking.wireless.enable = true;
      #networking.wireless.userControlled.enable = true;

      networking.networkmanager.enable = true;

      #networking.wireless.iwd = {
      #	enable = true;
      #	settings = {
      #		General = {
      #			EnableNetworkConfiguration = true;
      #		};
      #	};
      #};

      #services.connman = {
      #	enable = true;
      #	wifi.backend = "iwd";
      #};

      # The global useDHCP flag is deprecated, therefore explicitly set to false here.
      # Per-interface useDHCP will be mandatory in the future, so this generated config
      # replicates the default behaviour.
      networking.useDHCP = false;

      # Configure network proxy if necessary
      # networking.proxy.default = "http://user:password@proxy:port/";
      # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

      # Enable the OpenSSH daemon.
      services.openssh.enable = true;

      # Open ports in the firewall.
      # networking.firewall.allowedTCPPorts = [ ... ];
      # networking.firewall.allowedUDPPorts = [ ... ];
      # Or disable the firewall altogether.
      # networking.firewall.enable = false;

      # Some programs need SUID wrappers, can be configured further or are
      # started in user sessions.
      programs.mtr.enable = true;
      programs.gnupg.agent = {
            enable = true;
            enableSSHSupport = true;
      };

      services.i2pd = {
            #enable = true;
            #enableIPv4 = true;
            #enableIPv6 = true;
      };

      environment.systemPackages = with pkgs; [
            #iwgtk # gtk iwd (wireless daemon) gui
            networkmanagerapplet # networkmanager systay
      ];
}

