{
  description = ''library for scraping google search results'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-googlesearch-v0_1_0.flake = false;
  inputs.src-googlesearch-v0_1_0.type = "github";
  inputs.src-googlesearch-v0_1_0.owner = "xyb";
  inputs.src-googlesearch-v0_1_0.repo = "googlesearch.nim";
  inputs.src-googlesearch-v0_1_0.ref = "refs/tags/v0.1.0";
  inputs.src-googlesearch-v0_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."nimquery".type = "github";
  inputs."nimquery".owner = "riinr";
  inputs."nimquery".repo = "flake-nimble";
  inputs."nimquery".ref = "flake-pinning";
  inputs."nimquery".dir = "nimpkgs/n/nimquery";
  inputs."nimquery".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimquery".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-googlesearch-v0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-googlesearch-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-googlesearch-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}