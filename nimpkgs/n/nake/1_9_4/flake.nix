{
  description = ''make-like for Nim. Describe your builds as tasks!'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nake-1_9_4.flake = false;
  inputs.src-nake-1_9_4.type = "github";
  inputs.src-nake-1_9_4.owner = "fowlmouth";
  inputs.src-nake-1_9_4.repo = "nake";
  inputs.src-nake-1_9_4.ref = "refs/tags/1.9.4";
  inputs.src-nake-1_9_4.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nake-1_9_4, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nake-1_9_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nake-1_9_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}