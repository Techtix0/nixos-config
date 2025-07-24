{stdenv, fetchurl, dpkg, autoPatchelfHook, qt5, ...}:
stdenv.stdenv.mkDerivation (finalAttrs: {
  pname = "Z-library";
  version = "2.4.3";

  src = fetchurl {
    url = "https://s3proxy.cdn-zlib.sk/te_public_files/soft/linux/zlibrary-setup-latest.deb";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

	unpackCmd = "dpkg -x $curSrc source";

  nativeBuildInputs = [
    dpkg
		autoPatchelfHook
		qt5.wrapQtAppsHook
  ];

  buildInputs = with qt5; [
    qtbase
		qtsvg
		qtwebengine
  ];

	installPhase = ''
		runHook preInstall

		mkdir -p $out/bin
		mv usr/share opt $out
		ln -s $out/opt/gfie-${finalAttrs.version}/gfie $out/bin/gfie

		runHook postInstall
	'';

  meta = {
    description = "Z-library desktop app";
    homepage = "https://1lib.sk/";
  };
})
