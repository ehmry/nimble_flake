{
  description = ''A high-level image I/O and manipulation library for Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-inumon-master.flake = false;
  inputs.src-inumon-master.type = "github";
  inputs.src-inumon-master.owner = "dizzyliam";
  inputs.src-inumon-master.repo = "inumon";
  inputs.src-inumon-master.ref = "refs/heads/master";
  
  
  inputs."nimterop".type = "github";
  inputs."nimterop".owner = "riinr";
  inputs."nimterop".repo = "flake-nimble";
  inputs."nimterop".ref = "flake-pinning";
  inputs."nimterop".dir = "nimpkgs/n/nimterop";

  
  inputs."arraymancer".type = "github";
  inputs."arraymancer".owner = "riinr";
  inputs."arraymancer".repo = "flake-nimble";
  inputs."arraymancer".ref = "flake-pinning";
  inputs."arraymancer".dir = "nimpkgs/a/arraymancer";

  
  inputs."nigui".type = "github";
  inputs."nigui".owner = "riinr";
  inputs."nigui".repo = "flake-nimble";
  inputs."nigui".ref = "flake-pinning";
  inputs."nigui".dir = "nimpkgs/n/nigui";

  outputs = { self, nixpkgs, flakeNimbleLib, src-inumon-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-inumon-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-inumon-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}