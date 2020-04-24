#!/usr/bin/env nix-shell
#!nix-shell -i bash -p carnix

DIR="$(dirname $0)"
carnix generate-nix --standalone --src "$DIR"

