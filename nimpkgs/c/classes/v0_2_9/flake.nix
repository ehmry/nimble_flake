{
  description = ''Adds class support to Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-classes-v0_2_9.flake = false;
  inputs.src-classes-v0_2_9.type = "github";
  inputs.src-classes-v0_2_9.owner = "jjv360";
  inputs.src-classes-v0_2_9.repo = "nim-classes";
  inputs.src-classes-v0_2_9.ref = "refs/tags/v0.2.9";
  inputs.src-classes-v0_2_9.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-classes-v0_2_9, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-classes-v0_2_9;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-classes-v0_2_9"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}