{
  description = ''subhook wrapper'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-subhook-0_5_2.flake = false;
  inputs.src-subhook-0_5_2.type = "github";
  inputs.src-subhook-0_5_2.owner = "ba0f3";
  inputs.src-subhook-0_5_2.repo = "subhook.nim";
  inputs.src-subhook-0_5_2.ref = "refs/tags/0.5.2";
  inputs.src-subhook-0_5_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-subhook-0_5_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-subhook-0_5_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-subhook-0_5_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}