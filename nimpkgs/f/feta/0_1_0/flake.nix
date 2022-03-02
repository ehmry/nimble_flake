{
  description = ''A domain-specific for general purpose office automation. The language is embedded in Nim and allows for quick and easy integration of different office software environments.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-feta-0_1_0.flake = false;
  inputs.src-feta-0_1_0.type = "github";
  inputs.src-feta-0_1_0.owner = "FlorianRauls";
  inputs.src-feta-0_1_0.repo = "office-DSL-thesis";
  inputs.src-feta-0_1_0.ref = "refs/tags/0.1.0";
  inputs.src-feta-0_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."mime".type = "github";
  # inputs."mime".owner = "riinr";
  # inputs."mime".repo = "flake-nimble";
  # inputs."mime".ref = "flake-pinning";
  # inputs."mime".dir = "nimpkgs/m/mime";
  # inputs."mime".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."mime".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."jester".type = "github";
  # inputs."jester".owner = "riinr";
  # inputs."jester".repo = "flake-nimble";
  # inputs."jester".ref = "flake-pinning";
  # inputs."jester".dir = "nimpkgs/j/jester";
  # inputs."jester".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."jester".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."googleapi".type = "github";
  # inputs."googleapi".owner = "riinr";
  # inputs."googleapi".repo = "flake-nimble";
  # inputs."googleapi".ref = "flake-pinning";
  # inputs."googleapi".dir = "nimpkgs/g/googleapi";
  # inputs."googleapi".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."googleapi".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."ws".type = "github";
  # inputs."ws".owner = "riinr";
  # inputs."ws".repo = "flake-nimble";
  # inputs."ws".ref = "flake-pinning";
  # inputs."ws".dir = "nimpkgs/w/ws";
  # inputs."ws".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."ws".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-feta-0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-feta-0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-feta-0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}