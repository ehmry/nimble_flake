{
  description = ''Amazon Web Services (AWS) APIs'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-atoz-2613_0_0.flake = false;
  inputs.src-atoz-2613_0_0.type = "github";
  inputs.src-atoz-2613_0_0.owner = "disruptek";
  inputs.src-atoz-2613_0_0.repo = "atoz";
  inputs.src-atoz-2613_0_0.ref = "refs/tags/2613.0.0";
  inputs.src-atoz-2613_0_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."sigv4".type = "github";
  # inputs."sigv4".owner = "riinr";
  # inputs."sigv4".repo = "flake-nimble";
  # inputs."sigv4".ref = "flake-pinning";
  # inputs."sigv4".dir = "nimpkgs/s/sigv4";
  # inputs."sigv4".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."sigv4".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."https://github.com/disruptek/rest.git".type = "github";
  # inputs."https://github.com/disruptek/rest.git".owner = "riinr";
  # inputs."https://github.com/disruptek/rest.git".repo = "flake-nimble";
  # inputs."https://github.com/disruptek/rest.git".ref = "flake-pinning";
  # inputs."https://github.com/disruptek/rest.git".dir = "nimpkgs/h/https://github.com/disruptek/rest.git";
  # inputs."https://github.com/disruptek/rest.git".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."https://github.com/disruptek/rest.git".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."https://github.com/disruptek/openapi.git".type = "github";
  # inputs."https://github.com/disruptek/openapi.git".owner = "riinr";
  # inputs."https://github.com/disruptek/openapi.git".repo = "flake-nimble";
  # inputs."https://github.com/disruptek/openapi.git".ref = "flake-pinning";
  # inputs."https://github.com/disruptek/openapi.git".dir = "nimpkgs/h/https://github.com/disruptek/openapi.git";
  # inputs."https://github.com/disruptek/openapi.git".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."https://github.com/disruptek/openapi.git".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."npeg".type = "github";
  # inputs."npeg".owner = "riinr";
  # inputs."npeg".repo = "flake-nimble";
  # inputs."npeg".ref = "flake-pinning";
  # inputs."npeg".dir = "nimpkgs/n/npeg";
  # inputs."npeg".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."npeg".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-atoz-2613_0_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-atoz-2613_0_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-atoz-2613_0_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}