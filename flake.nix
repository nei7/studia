{
  description = "Studia";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    elegantnote = {
      url = "github:ElegantLaTeX/ElegantNote/master";
      flake = false;
    };
  };

  outputs = { self, elegantnote, nixpkgs, ... }:
    let
      supportedSystems = [ 
        "x86_64-linux" 
        "aarch64-linux" 
      ];
      
      forEachSupportedSystem = f:
        nixpkgs.lib.genAttrs supportedSystems
          (system: f {
            pkgs = import nixpkgs { inherit system; };
          });
    in {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = [
            (pkgs.texlive.combine {
                inherit (pkgs.texlive) scheme-full;
            })
            pkgs.octaveFull
            pkgs.skim
            pkgs.git
            pkgs.ghostscript
            pkgs.gnumake
          ];

          shellHook = ''
              export TEXINPUTS=".:${elegantnote}//:"
            '';
        };
      });
    };
}