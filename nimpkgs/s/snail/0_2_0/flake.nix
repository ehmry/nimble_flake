{
  description = ''Simple linear algebra for nim. Js too.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-snail-0_2_0.flake = false;
  inputs.src-snail-0_2_0.type = "github";
  inputs.src-snail-0_2_0.owner = "stisa";
  inputs.src-snail-0_2_0.repo = "snail";
  inputs.src-snail-0_2_0.ref = "refs/tags/0.2.0";
  inputs.src-snail-0_2_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."nimblas".type = "github";
  # inputs."nimblas".owner = "riinr";
  # inputs."nimblas".repo = "flake-nimble";
  # inputs."nimblas".ref = "flake-pinning";
  # inputs."nimblas".dir = "nimpkgs/n/nimblas";
  # inputs."nimblas".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."nimblas".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-snail-0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-snail-0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-snail-0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}