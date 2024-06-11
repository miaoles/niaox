{ lib
, fetchFromGitHub
, llvmPackages_13
, makeBinaryWrapper
, libiconv
, which
}:

let
      llvmPackages = llvmPackages_13;
      inherit (llvmPackages) stdenv;
in
stdenv.mkDerivation rec {
      pname = "odin";
      version = "dev-2024-06";

      src = fetchFromGitHub {
            owner = "odin-lang";
            repo = "Odin";
            rev = version;
            hash = "sha256-JGTC+Gi5mkHQHvd5CmEzrhi1muzWf1rUN4f5FT5K5vc=";
      };

      nativeBuildInputs = [
            makeBinaryWrapper
            which
      ];

      buildInputs = [ ];

      LLVM_CONFIG = "${llvmPackages.llvm.dev}/bin/llvm-config";

      postPatch = ''
            substituteInPlace build_odin.sh \
                --replace-fail '-framework System' '-lSystem'
            patchShebangs build_odin.sh
      '';

      dontConfigure = true;

      buildFlags = [
            "release"
      ];

      installPhase = ''
            runHook preInstall

            mkdir -p $out/bin
            cp odin $out/bin/odin

            mkdir -p $out/share
            cp -r base $out/share/base
            cp -r core $out/share/core
            cp -r vendor $out/share/vendor

            wrapProgram $out/bin/odin \
              --prefix PATH : ${lib.makeBinPath (with llvmPackages; [
                bintools
                llvm
                clang
                lld
              ])} \
              --set-default ODIN_ROOT $out/share

            runHook postInstall
      '';

      postBuild = lib.optionalString stdenv.isLinux ''
            make -C vendor/cgltf/src
            make -C vendor/miniaudio/src
            make -C vendor/stb/src
      '';

      meta = with lib; {
            description = "A fast, concise, readable, pragmatic and open sourced programming language";
            mainProgram = "odin";
            homepage = "https://odin-lang.org/";
            license = licenses.bsd3;
            maintainers = with maintainers; [ luc65r astavie znaniye ];
            platforms = platforms.x86_64;
      };
}

