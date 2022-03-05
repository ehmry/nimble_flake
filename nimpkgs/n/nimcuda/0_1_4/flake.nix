{
  description = ''CUDA bindings'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimcuda-0_1_4.flake = false;
  inputs.src-nimcuda-0_1_4.type = "github";
  inputs.src-nimcuda-0_1_4.owner = "andreaferretti";
  inputs.src-nimcuda-0_1_4.repo = "nimcuda";
  inputs.src-nimcuda-0_1_4.ref = "refs/tags/0.1.4";
  inputs.src-nimcuda-0_1_4.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimcuda-0_1_4, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimcuda-0_1_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimcuda-0_1_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}