{
  description = ''Micro benchmarking tool to measure speed of code, with the goal of optimizing it.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimbench-v0_1_1.flake = false;
  inputs.src-nimbench-v0_1_1.type = "github";
  inputs.src-nimbench-v0_1_1.owner = "ivankoster";
  inputs.src-nimbench-v0_1_1.repo = "nimbench";
  inputs.src-nimbench-v0_1_1.ref = "refs/tags/v0.1.1";
  
  
  inputs."strfmt".type = "github";
  inputs."strfmt".owner = "riinr";
  inputs."strfmt".repo = "flake-nimble";
  inputs."strfmt".ref = "flake-pinning";
  inputs."strfmt".dir = "nimpkgs/s/strfmt";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimbench-v0_1_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimbench-v0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimbench-v0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}