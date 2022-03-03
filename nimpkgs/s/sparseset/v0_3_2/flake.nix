{
  description = ''Sparsets for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-sparseset-v0_3_2.flake = false;
  inputs.src-sparseset-v0_3_2.type = "github";
  inputs.src-sparseset-v0_3_2.owner = "planetis-m";
  inputs.src-sparseset-v0_3_2.repo = "sparseset";
  inputs.src-sparseset-v0_3_2.ref = "refs/tags/v0.3.2";
  inputs.src-sparseset-v0_3_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-sparseset-v0_3_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-sparseset-v0_3_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-sparseset-v0_3_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}