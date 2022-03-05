{
  description = ''Wrapper to interface with the Lua interpreter'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."lua-master".type = "github";
  inputs."lua-master".owner = "riinr";
  inputs."lua-master".repo = "flake-nimble";
  inputs."lua-master".ref = "flake-pinning";
  inputs."lua-master".dir = "nimpkgs/l/lua/master";
  inputs."lua-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."lua-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}