{
  description = ''a tiny tool to bump nimble versions'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-bump-1_8_24.flake = false;
  inputs.src-bump-1_8_24.type = "github";
  inputs.src-bump-1_8_24.owner = "disruptek";
  inputs.src-bump-1_8_24.repo = "bump";
  inputs.src-bump-1_8_24.ref = "refs/tags/1.8.24";
  inputs.src-bump-1_8_24.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."https://github.com/disruptek/cutelog".type = "github";
  # inputs."https://github.com/disruptek/cutelog".owner = "riinr";
  # inputs."https://github.com/disruptek/cutelog".repo = "flake-nimble";
  # inputs."https://github.com/disruptek/cutelog".ref = "flake-pinning";
  # inputs."https://github.com/disruptek/cutelog".dir = "nimpkgs/h/https://github.com/disruptek/cutelog";
  # inputs."https://github.com/disruptek/cutelog".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."https://github.com/disruptek/cutelog".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."cligen".type = "github";
  # inputs."cligen".owner = "riinr";
  # inputs."cligen".repo = "flake-nimble";
  # inputs."cligen".ref = "flake-pinning";
  # inputs."cligen".dir = "nimpkgs/c/cligen";
  # inputs."cligen".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."cligen".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-bump-1_8_24, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-bump-1_8_24;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-bump-1_8_24"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}