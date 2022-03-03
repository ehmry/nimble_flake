{
  description = ''Wrapper-less C/C++ interop for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimline-v0_1_3.flake = false;
  inputs.src-nimline-v0_1_3.type = "github";
  inputs.src-nimline-v0_1_3.owner = "fragcolor-xyz";
  inputs.src-nimline-v0_1_3.repo = "nimline";
  inputs.src-nimline-v0_1_3.ref = "refs/tags/v0.1.3";
  inputs.src-nimline-v0_1_3.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimline-v0_1_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimline-v0_1_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimline-v0_1_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}