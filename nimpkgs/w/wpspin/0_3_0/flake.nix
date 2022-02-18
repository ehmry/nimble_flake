{
  description = ''Full-featured WPS PIN generator'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-wpspin-0_3_0.flake = false;
  inputs.src-wpspin-0_3_0.type = "github";
  inputs.src-wpspin-0_3_0.owner = "drygdryg";
  inputs.src-wpspin-0_3_0.repo = "wpspin-nim";
  inputs.src-wpspin-0_3_0.ref = "refs/tags/0.3.0";
  
  
  inputs."argparse".type = "github";
  inputs."argparse".owner = "riinr";
  inputs."argparse".repo = "flake-nimble";
  inputs."argparse".ref = "flake-pinning";
  inputs."argparse".dir = "nimpkgs/a/argparse";

  outputs = { self, nixpkgs, flakeNimbleLib, src-wpspin-0_3_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-wpspin-0_3_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-wpspin-0_3_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}