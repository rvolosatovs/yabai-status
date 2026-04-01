{
  lib,
  stdenv,
  swift,
  swiftpm,
  ...
}:
stdenv.mkDerivation {
  pname = "yabai-status";
  version = "0.1.0";

  src = lib.cleanSource ../.;

  nativeBuildInputs = [
    swift
    swiftpm
  ];

  buildPhase = ''
    runHook preBuild
    swift build -c release --skip-update
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    install -Dm755 .build/release/yabai-status $out/bin/yabai-status
    runHook postInstall
  '';

  meta = {
    description = "yabai space indicator for the macOS menu bar";
    platforms = lib.platforms.darwin;
    mainProgram = "yabai-status";
  };
}
