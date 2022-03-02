{
  description = ''WIP strongly-typed argument parser with sub command support'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-argparse-v2_0_0.flake = false;
  inputs.src-argparse-v2_0_0.type = "github";
  inputs.src-argparse-v2_0_0.owner = "iffy";
  inputs.src-argparse-v2_0_0.repo = "nim-argparse";
  inputs.src-argparse-v2_0_0.ref = "refs/tags/v2.0.0";
  inputs.src-argparse-v2_0_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-argparse-v2_0_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-argparse-v2_0_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-argparse-v2_0_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}