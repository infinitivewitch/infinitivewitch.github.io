{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.default = pkgs.stdenv.mkDerivation rec {
      pname = "infinitivewitch.github.io";
      version = "neoathame";
      src = ../.;
      nativeBuildInputs = [pkgs.zola];
      configurePhase = ''
        mkdir -p "themes/neoathame"
        ln -s ${inputs.neoathame}/* "themes/neoathame"
      '';
      buildPhase = "zola build";
      installPhase = "cp -r public $out";
    };
  };
}
