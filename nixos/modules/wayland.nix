{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		#river
		#foot
	];
}
