{
  description = ''a state-of-the-art multithreading runtime'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-weave-master.flake = false;
  inputs.src-weave-master.type = "github";
  inputs.src-weave-master.owner = "mratsim";
  inputs.src-weave-master.repo = "weave";
  inputs.src-weave-master.ref = "refs/heads/master";
  
  
  inputs."synthesis".type = "github";
  inputs."synthesis".owner = "riinr";
  inputs."synthesis".repo = "flake-nimble";
  inputs."synthesis".ref = "flake-pinning";
  inputs."synthesis".dir = "nimpkgs/s/synthesis";

  outputs = { self, nixpkgs, flakeNimbleLib, src-weave-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-weave-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-weave-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}