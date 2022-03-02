{
  description = ''Obsolete - please use egl instead!'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."io-egl-master".type = "github";
  inputs."io-egl-master".owner = "riinr";
  inputs."io-egl-master".repo = "flake-nimble";
  inputs."io-egl-master".ref = "flake-pinning";
  inputs."io-egl-master".dir = "nimpkgs/i/io-egl/master";

  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}