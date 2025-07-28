{
  description = "TET grammar for tree-sitter";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem = { system, pkgs, lib, ... }: {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            tree-sitter
            nodejs_latest
          ];
        };
        # packages = rec {
        # };
      };
    };
}
