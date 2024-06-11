{ pkgs, ... }:

{
      environment.systemPackages = with pkgs; [
            tint2
            xtitle
      ];
}
