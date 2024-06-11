{ ... }:

{
	# These conflict with Pipewire.
	sound.enable = true;
	hardware.pulseaudio.enable = true;
	hardware.pulseaudio.support32Bit = true;
	nixpkgs.config.pulseaudio = true;

	#services.pipewire = {
	#	enable = true;
	#	alsa.enable = true;
	#	alsa.support32Bit = true;
	#	pulse.enable = true;
	#	jack.enable = true;
		# use the example session manager (no others are packaged yet so this is enabled by default,
		# no need to redefine it in your config for now)
	#	media-session.enable = true;
	#};

	# Apparently needed by Pipewire?
	#security.rtkit.enable = true;
}
