{
  description = ''A domain-specific for general purpose office automation. The language is embedded in Nim and allows for quick and easy integration of different office software environments.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-feta-0_0_6.flake = false;
  inputs.src-feta-0_0_6.type = "github";
  inputs.src-feta-0_0_6.owner = "FlorianRauls";
  inputs.src-feta-0_0_6.repo = "office-DSL-thesis";
  inputs.src-feta-0_0_6.ref = "refs/tags/0.0.6";
  inputs.src-feta-0_0_6.inputs.nixpkgs.follows = "nixpkgs";
  
  
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

  outputs = { self, nixpkgs, flakeNimbleLib, src-feta-0_0_6, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-feta-0_0_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-feta-0_0_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}