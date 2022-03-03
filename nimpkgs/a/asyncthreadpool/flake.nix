{
  description = ''Awaitable threadpool'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."asyncthreadpool-main".type = "github";
  inputs."asyncthreadpool-main".owner = "riinr";
  inputs."asyncthreadpool-main".repo = "flake-nimble";
  inputs."asyncthreadpool-main".ref = "flake-pinning";
  inputs."asyncthreadpool-main".dir = "nimpkgs/a/asyncthreadpool/main";
  inputs."asyncthreadpool-main".inputs.nixpkgs.follows = "nixpkgs";
  inputs."asyncthreadpool-main".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}