{
  description = ''A Jester web plugin that embeds key information into a JSON object.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-jesterjson-v1_0_1.flake = false;
  inputs.src-jesterjson-v1_0_1.type = "github";
  inputs.src-jesterjson-v1_0_1.owner = "JohnAD";
  inputs.src-jesterjson-v1_0_1.repo = "jesterjson";
  inputs.src-jesterjson-v1_0_1.ref = "refs/tags/v1.0.1";
  inputs.src-jesterjson-v1_0_1.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."jesterwithplugins".type = "github";
  # inputs."jesterwithplugins".owner = "riinr";
  # inputs."jesterwithplugins".repo = "flake-nimble";
  # inputs."jesterwithplugins".ref = "flake-pinning";
  # inputs."jesterwithplugins".dir = "nimpkgs/j/jesterwithplugins";
  # inputs."jesterwithplugins".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."jesterwithplugins".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-jesterjson-v1_0_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-jesterjson-v1_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-jesterjson-v1_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}