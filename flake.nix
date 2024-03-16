{
  description = "Conditional compilation via attributes for OCaml";

  inputs.minttea.url = "github:leostera/minttea";
  inputs.minttea.inputs.nixpkgs.follows = "nixpkgs";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }:
        let
          inherit (pkgs) ocamlPackages mkShell;
          inherit (ocamlPackages) buildDunePackage;
          name = "config";
          version = "0.0.1";
        in
          {
            devShells = {
              default = mkShell {
                buildInputs = [ ocamlPackages.utop ];
                inputsFrom = [ self'.packages.default ];
              };
            };

            packages = {
              default = buildDunePackage {
                inherit version;
                pname = name;
                propagatedBuildInputs = with ocamlPackages; [
                  inputs'.minttea.packages.spices
                  sedlex
                  ppxlib
                ];
                src = ./.;
              };
            };
          };
    };
}
