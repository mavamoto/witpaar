{
  description = "Hugo dev environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.hugo
        ];

        shellHook = ''
  if [ -z "$HUGO_ENV_LOADED" ]; then
    export HUGO_ENV_LOADED=1
    echo "Hugo listo en este entorno 🚀"
  fi
        '';
      };
    };
}
