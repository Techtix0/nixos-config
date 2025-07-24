# stdenv, fetchurl, dpkg, autoPatchelfHook, qt5
{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation rec {
  pname = "Z-library";
  version = "2.4.3";

  src = pkgs.fetchurl {
    url = "https://s3proxy.cdn-zlib.sk/te_public_files/soft/linux/zlibrary-setup-latest.deb";
    hash = "sha256-OywGJdVUAGxK+C14akbLzhkt/5QE6+lchPHteksOLLY=";
  };

	unpackCmd = "dpkg -x $curSrc source";

  nativeBuildInputs = [
    pkgs.dpkg
		pkgs.autoPatchelfHook
		pkgs.qt5.wrapQtAppsHook
  ];

  buildInputs = with pkgs.qt5; [
    qtbase
		qtsvg
		qtwebengine
  ];

	installPhase = ''
		runHook preInstall

		mkdir -p $out
		dpkg -x $src $out
		cp -r usr/* $out

		ln -s "$out/share/zlibrary/zlibrary" "$out/bin/zlibrary"

		runHook postInstall
	'';

  meta = {
    description = "Z-library desktop app";
    homepage = "https://1lib.sk/";
  };
}
