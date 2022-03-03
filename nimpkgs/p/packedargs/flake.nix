{
  description = ''a convention mainly created for `createThread` proc'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."packedargs-main".type = "github";
  inputs."packedargs-main".owner = "riinr";
  inputs."packedargs-main".repo = "flake-nimble";
  inputs."packedargs-main".ref = "flake-pinning";
  inputs."packedargs-main".dir = "nimpkgs/p/packedargs/main";
  inputs."packedargs-main".inputs.nixpkgs.follows = "nixpkgs";
  inputs."packedargs-main".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}