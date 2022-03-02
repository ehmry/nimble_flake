{
  description = ''libarchive wrapper for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimarchive-v0_3_0.flake = false;
  inputs.src-nimarchive-v0_3_0.type = "github";
  inputs.src-nimarchive-v0_3_0.owner = "genotrance";
  inputs.src-nimarchive-v0_3_0.repo = "nimarchive";
  inputs.src-nimarchive-v0_3_0.ref = "refs/tags/v0.3.0";
  
  
  inputs."nimterop".type = "github";
  inputs."nimterop".owner = "riinr";
  inputs."nimterop".repo = "flake-nimble";
  inputs."nimterop".ref = "flake-pinning";
  inputs."nimterop".dir = "nimpkgs/n/nimterop";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimarchive-v0_3_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimarchive-v0_3_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimarchive-v0_3_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}