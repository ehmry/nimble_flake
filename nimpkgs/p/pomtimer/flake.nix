{
  description = ''A simple pomodoro timer for the comandline with cli-output and notifications.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."pomtimer-master".type = "github";
  inputs."pomtimer-master".owner = "riinr";
  inputs."pomtimer-master".repo = "flake-nimble";
  inputs."pomtimer-master".ref = "flake-pinning";
  inputs."pomtimer-master".dir = "nimpkgs/p/pomtimer/master";

  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}