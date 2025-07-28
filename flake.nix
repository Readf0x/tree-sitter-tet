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
        packages = rec {
          tree-sitter-tet = pkgs.tree-sitter.buildGrammar {
            language = "tet";
            version = "0.1.0";
            src = ./.;
            meta.homepage = "https://github.com/readf0x/tree-sitter-tet";
          };
          default = tree-sitter-tet;
        };
      };
    };
}
