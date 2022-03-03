{
  description = ''Matrix library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-manu-v2_1_2.flake = false;
  inputs.src-manu-v2_1_2.type = "github";
  inputs.src-manu-v2_1_2.owner = "planetis-m";
  inputs.src-manu-v2_1_2.repo = "manu";
  inputs.src-manu-v2_1_2.ref = "refs/tags/v2.1.2";
  inputs.src-manu-v2_1_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-manu-v2_1_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-manu-v2_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-manu-v2_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}