{
  description = "Projekty";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
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
              inherit (pkgs.texlive)
                scheme-small
                latexmk
                luatex
                biber
                amsmath
                graphics
                koma-script
                babel-german
                hyperref
                fontawesome5
                tcolorbox
                latexindent;
            })
            pkgs.octaveFull
            pkgs.skim
            pkgs.git
            pkgs.ghostscript
            pkgs.gnumake
          ];
        };
      });
    };
}