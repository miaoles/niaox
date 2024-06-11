{ niaox, pkgs, ... }:

{
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "24.11";

      nix = {
            package = pkgs.nixVersions.latest;
            settings.experimental-features = [
                  "nix-command"
                  "flakes"
            ];
      };

      nixpkgs.config = {
            allowUnfree = true;
            permittedInsecurePackages = [ ];
      };

      time.timeZone = niaox.host.timeZone;
      i18n.defaultLocale = niaox.host.locale;

      console = {
            font = "Lat2-Terminus16";
            keyMap = "us";
      };

      # Miscellanous Packages
      environment.systemPackages = with pkgs; [
            file
            killall
            htop
            git
            unzip
            unar
            ntfs3g
            fzf # fuzzy find
            fetchutils # js fetch api
            wget # downloader
            appimage-run
            featherpad # qt text editor
            openrgb # hardware rgb
            i2c-tools
            jdk # Java
            ventoy-bin # bootable USB creator
            v4l-utils # media device utilities
            kid3 # audio tagger
            ffmpeg
            glxinfo
            feh # image gui
            libexif
            fd # "find" alternative
            scrot # screenshots
            patchutils
            xdotool # x11 utilities
            python3
            yt-dlp # youtube downloader
            jq # json processor
      ];
}

