{
  description = ''A Nim library for making lightweight Electron-like HTML/JS GUI apps, with full access to Nim capabilities.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-neel-v0_2_7.flake = false;
  inputs.src-neel-v0_2_7.type = "github";
  inputs.src-neel-v0_2_7.owner = "Niminem";
  inputs.src-neel-v0_2_7.repo = "Neel";
  inputs.src-neel-v0_2_7.ref = "refs/tags/v0.2.7";
  inputs.src-neel-v0_2_7.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."jester".type = "github";
  inputs."jester".owner = "riinr";
  inputs."jester".repo = "flake-nimble";
  inputs."jester".ref = "flake-pinning";
  inputs."jester".dir = "nimpkgs/j/jester";
  inputs."jester".inputs.nixpkgs.follows = "nixpkgs";
  inputs."jester".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  inputs."ws".type = "github";
  inputs."ws".owner = "riinr";
  inputs."ws".repo = "flake-nimble";
  inputs."ws".ref = "flake-pinning";
  inputs."ws".dir = "nimpkgs/w/ws";
  inputs."ws".inputs.nixpkgs.follows = "nixpkgs";
  inputs."ws".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-Neel-v0_2_7, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-Neel-v0_2_7;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-Neel-v0_2_7"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}