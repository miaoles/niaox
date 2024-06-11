{ pkgs, ... }:

{
	fonts = {
		enableDefaultPackages = true;
		#enableDefaultFonts = true;

		#fonts = with pkgs; [
		packages = with pkgs; [
			roboto
			roboto-mono
			roboto-slab
			noto-fonts
			noto-fonts-cjk
			noto-fonts-emoji
		];

		fontconfig = {
			defaultFonts = {
				sansSerif = [ "Roboto" ];
				serif = [ "Roboto Slab" ];
				monospace = [ "Roboto Mono" ];
			};
			subpixel = {
				#rbga = "none";
				lcdfilter = "light";
			};
			hinting = {
				enable = true;
				style = "none";
				#style = "hintnone";
			};
			antialias = true;
			cache32Bit = true;
		};
	};
}
