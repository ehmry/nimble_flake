{
  description = ''Statistic-driven microbenchmark framework'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-criterion-0_2_6.flake = false;
  inputs.src-criterion-0_2_6.type = "github";
  inputs.src-criterion-0_2_6.owner = "disruptek";
  inputs.src-criterion-0_2_6.repo = "criterion";
  inputs.src-criterion-0_2_6.ref = "refs/tags/0.2.6";
  inputs.src-criterion-0_2_6.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."https://github.com/disruptek/testes".type = "github";
  # inputs."https://github.com/disruptek/testes".owner = "riinr";
  # inputs."https://github.com/disruptek/testes".repo = "flake-nimble";
  # inputs."https://github.com/disruptek/testes".ref = "flake-pinning";
  # inputs."https://github.com/disruptek/testes".dir = "nimpkgs/h/https://github.com/disruptek/testes";
  # inputs."https://github.com/disruptek/testes".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."https://github.com/disruptek/testes".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-criterion-0_2_6, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-criterion-0_2_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-criterion-0_2_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}