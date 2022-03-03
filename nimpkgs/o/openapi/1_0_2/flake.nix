{
  description = ''OpenAPI Code Generator'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-openapi-1_0_2.flake = false;
  inputs.src-openapi-1_0_2.type = "github";
  inputs.src-openapi-1_0_2.owner = "disruptek";
  inputs.src-openapi-1_0_2.repo = "openapi";
  inputs.src-openapi-1_0_2.ref = "refs/tags/1.0.2";
  inputs.src-openapi-1_0_2.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."npeg".type = "github";
  # inputs."npeg".owner = "riinr";
  # inputs."npeg".repo = "flake-nimble";
  # inputs."npeg".ref = "flake-pinning";
  # inputs."npeg".dir = "nimpkgs/n/npeg";
  # inputs."npeg".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."npeg".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."foreach".type = "github";
  # inputs."foreach".owner = "riinr";
  # inputs."foreach".repo = "flake-nimble";
  # inputs."foreach".ref = "flake-pinning";
  # inputs."foreach".dir = "nimpkgs/f/foreach";
  # inputs."foreach".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."foreach".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-openapi-1_0_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-openapi-1_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-openapi-1_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}