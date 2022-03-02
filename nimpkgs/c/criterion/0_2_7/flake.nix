{
  description = ''Statistic-driven microbenchmark framework'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-criterion-0_2_7.flake = false;
  inputs.src-criterion-0_2_7.type = "github";
  inputs.src-criterion-0_2_7.owner = "disruptek";
  inputs.src-criterion-0_2_7.repo = "criterion";
  inputs.src-criterion-0_2_7.ref = "refs/tags/0.2.7";
  inputs.src-criterion-0_2_7.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."https://github.com/disruptek/balls".type = "github";
  # inputs."https://github.com/disruptek/balls".owner = "riinr";
  # inputs."https://github.com/disruptek/balls".repo = "flake-nimble";
  # inputs."https://github.com/disruptek/balls".ref = "flake-pinning";
  # inputs."https://github.com/disruptek/balls".dir = "nimpkgs/h/https://github.com/disruptek/balls";
  # inputs."https://github.com/disruptek/balls".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."https://github.com/disruptek/balls".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-criterion-0_2_7, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-criterion-0_2_7;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-criterion-0_2_7"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}