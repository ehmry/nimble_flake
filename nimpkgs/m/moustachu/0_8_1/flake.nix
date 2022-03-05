{
  description = ''Mustache templating for Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-moustachu-0_8_1.flake = false;
  inputs.src-moustachu-0_8_1.type = "github";
  inputs.src-moustachu-0_8_1.owner = "fenekku";
  inputs.src-moustachu-0_8_1.repo = "moustachu";
  inputs.src-moustachu-0_8_1.ref = "refs/tags/0.8.1";
  inputs.src-moustachu-0_8_1.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."commandeer".type = "github";
  inputs."commandeer".owner = "riinr";
  inputs."commandeer".repo = "flake-nimble";
  inputs."commandeer".ref = "flake-pinning";
  inputs."commandeer".dir = "nimpkgs/c/commandeer";
  inputs."commandeer".inputs.nixpkgs.follows = "nixpkgs";
  inputs."commandeer".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-moustachu-0_8_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-moustachu-0_8_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-moustachu-0_8_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}