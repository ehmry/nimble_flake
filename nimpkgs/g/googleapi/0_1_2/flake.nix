{
  description = ''Google API for nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-googleapi-0_1_2.flake = false;
  inputs.src-googleapi-0_1_2.type = "github";
  inputs.src-googleapi-0_1_2.owner = "treeform";
  inputs.src-googleapi-0_1_2.repo = "googleapi";
  inputs.src-googleapi-0_1_2.ref = "refs/tags/0.1.2";
  inputs.src-googleapi-0_1_2.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."jwt".type = "github";
  # inputs."jwt".owner = "riinr";
  # inputs."jwt".repo = "flake-nimble";
  # inputs."jwt".ref = "flake-pinning";
  # inputs."jwt".dir = "nimpkgs/j/jwt";
  # inputs."jwt".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."jwt".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-googleapi-0_1_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-googleapi-0_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-googleapi-0_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}