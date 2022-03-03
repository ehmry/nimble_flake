{
  description = ''Generic tokenizer written in Nim language 👑 Powered by Nim's Macros'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."toktok-main".type = "github";
  inputs."toktok-main".owner = "riinr";
  inputs."toktok-main".repo = "flake-nimble";
  inputs."toktok-main".ref = "flake-pinning";
  inputs."toktok-main".dir = "nimpkgs/t/toktok/main";
  inputs."toktok-main".inputs.nixpkgs.follows = "nixpkgs";
  inputs."toktok-main".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}