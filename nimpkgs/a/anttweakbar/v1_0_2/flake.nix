{
  description = ''nim wrapper around the AntTweakBar c library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-AntTweakBar-v1_0_2.flake = false;
  inputs.src-AntTweakBar-v1_0_2.type = "github";
  inputs.src-AntTweakBar-v1_0_2.owner = "krux02";
  inputs.src-AntTweakBar-v1_0_2.repo = "nimAntTweakBar";
  inputs.src-AntTweakBar-v1_0_2.ref = "refs/tags/v1.0.2";
  inputs.src-AntTweakBar-v1_0_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-AntTweakBar-v1_0_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-AntTweakBar-v1_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-AntTweakBar-v1_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}