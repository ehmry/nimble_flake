{
  description = ''Simple multidimensional vector math'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-vectors-master.flake = false;
  inputs.src-vectors-master.type = "github";
  inputs.src-vectors-master.owner = "blamestross";
  inputs.src-vectors-master.repo = "nimrod-vectors";
  inputs.src-vectors-master.ref = "refs/heads/master";
  inputs.src-vectors-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-vectors-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-vectors-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-vectors-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}