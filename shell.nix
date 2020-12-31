{ pkgs ? import <nixpkgs> { } }:
let
  cargo_nix = pkgs.callPackage ./Cargo.nix { };
  rustlings = cargo_nix.rootCrate.build;
in with pkgs;
mkShell {
  buildInputs = [
    cargo
    cargo-edit
    rustc
    rustPackages.clippy
    rustPackages.rustfmt
    rustlings
    rls
  ];
  shellHook = ''
    export RUST_SRC_PATH="${rustPlatform.rustcSrc}"
    export RACER_CMD="${rustracer}/bin/racer"
  '';
}
