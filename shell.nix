{ pkgs ? import <nixpkgs> { } }:
let rustlings = (import ./Cargo.nix).rustlings { };
in with pkgs;
mkShell {
  buildInputs = [
    cargo
    cargo-edit
    rustc
    rustPackages.clippy
    rustPackages.rustfmt
    rustlings
  ];
  shellHook = ''
    export RUST_SRC_PATH="${rustPlatform.rustcSrc}"
    export RACER_CMD="${rustracer}/bin/racer"
  '';
}
