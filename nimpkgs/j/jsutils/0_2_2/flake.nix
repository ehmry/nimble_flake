{
  description = ''Utils to work with javascript'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-jsutils-0_2_2.flake = false;
  inputs.src-jsutils-0_2_2.type = "github";
  inputs.src-jsutils-0_2_2.owner = "kidandcat";
  inputs.src-jsutils-0_2_2.repo = "jsutils";
  inputs.src-jsutils-0_2_2.ref = "refs/tags/0.2.2";
  inputs.src-jsutils-0_2_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-jsutils-0_2_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-jsutils-0_2_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-jsutils-0_2_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}