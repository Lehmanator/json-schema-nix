{
  description = "Flake providing utils & libs to work with generic schema formats";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    devshell.url = "github:numtide/devshell";
    flake-parts.url = "github:hercules-ci/flake-parts";
    haumea.url = "github:nix-community/haumea";
  };
  outputs = { self, nixpkgs, flake-parts, ... }@inputs:
  flake-parts.lib.mkFlake {inherit inputs;}
  {
    imports = [inputs.devshell.flakeModule];
    debug = true;
    systems = ["aarch64-linux" "aarch64-darwin" "riscv64-linux" "x86_64-linux" "x86_64-darwin"];
    perSystem = {config, lib, pkgs, system, ...}: {
      formatter = pkgs.nixpkgs-fmt;
      apps = { };
      packages = inputs.haumea.lib.load {
        src = ./nix/packages;
        loader = inputs: path: pkgs.callPackage path {};
        transformer = inputs.haumea.lib.transformers.liftDefault;
      };
      devshells = rec {
        default = json-schema;
        json-schema = {
          commands = [
            { package=config.formatter; category="formatter"; }
          ];
          packages = [
            config.packages.jsonschemas-schemastore
            config.packages.jsonschemas-kubernetes
            config.packages.jsonschema-jsonresume
            config.packages.jsonschema-spec
            pkgs.vimPlugins.SchemaStore-nvim
            pkgs.json-schema-for-humans
            pkgs.check-jsonschema
            pkgs.yajsv
            # https://github.com/instrumenta/openapi2jsonschema
            # https://github.com/yannh/kubernetes-json-schema/
            # https://github.com/yannh/kubeconform
            # https://github.com/jtyr/kubeconform-helm
            # https://github.com/1rgs/jsonformer
            # https://js.langchain.com/docs/integrations/chat/ollama_functions
            # https://github.com/jxnl/instructor/
            # https://github.com/SchemaStore/schemastore/tree/master/src/schemas/json
          ];
          serviceGroups.develop = {
            #services.api-docs = {
            #  name = "api-docs";
            #  command = "mkdir build && ${pkgs.json-schema-for-humans}/bin/generate-schema-doc ${config.packages.jsonschema-jsonresume} build";
            #};
            services.run-api-docs = {
              name = "run-api-docs";
              command = "mkdir -p build && ${pkgs.json-schema-for-humans}/bin/generate-schema-doc ${config.packages.jsonschema-jsonresume} build && ${pkgs.darkhttpd}/bin/darkhttpd build";
              #command = "${lib.getExe pkgs.httplab}";
            };
          };
        };
      };
    };
    flake = {
    };
  };
}
