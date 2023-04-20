{inputs, ...}: {
  perSystem = {
    config,
    pkgs,
    lib,
    ...
  }: {
    apps.default = let
      zola-serve = pkgs.writeScriptBin "run" ''
        mkdir -p themes
        if [[ -d themes/neoathame ]]; then
          true
        else
          ln -sn ${inputs.neoathame} themes/neoathame
        fi
        ${pkgs.zola}/bin/zola -r $(${lib.getExe config.flake-root.package}) serve
      '';
    in {
      type = "app";
      program = "${zola-serve}/bin/run";
    };
  };
}
