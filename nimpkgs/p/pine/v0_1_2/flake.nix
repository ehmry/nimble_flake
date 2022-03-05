{
  description = ''Nim Static Blog & Site Generator'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-pine-v0_1_2.flake = false;
  inputs.src-pine-v0_1_2.type = "github";
  inputs.src-pine-v0_1_2.owner = "Willyboar";
  inputs.src-pine-v0_1_2.repo = "pine";
  inputs.src-pine-v0_1_2.ref = "refs/tags/v0.1.2";
  inputs.src-pine-v0_1_2.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."markdown".type = "github";
  inputs."markdown".owner = "riinr";
  inputs."markdown".repo = "flake-nimble";
  inputs."markdown".ref = "flake-pinning";
  inputs."markdown".dir = "nimpkgs/m/markdown";
  inputs."markdown".inputs.nixpkgs.follows = "nixpkgs";
  inputs."markdown".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  inputs."rainbow".type = "github";
  inputs."rainbow".owner = "riinr";
  inputs."rainbow".repo = "flake-nimble";
  inputs."rainbow".ref = "flake-pinning";
  inputs."rainbow".dir = "nimpkgs/r/rainbow";
  inputs."rainbow".inputs.nixpkgs.follows = "nixpkgs";
  inputs."rainbow".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-pine-v0_1_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pine-v0_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-pine-v0_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}