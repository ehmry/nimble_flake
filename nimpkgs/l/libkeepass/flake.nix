{
  description = ''Library for reading KeePass files and decrypt the passwords within it'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."libkeepass-master".type = "github";
  inputs."libkeepass-master".owner = "riinr";
  inputs."libkeepass-master".repo = "flake-nimble";
  inputs."libkeepass-master".ref = "flake-pinning";
  inputs."libkeepass-master".dir = "nimpkgs/l/libkeepass/master";
  inputs."libkeepass-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."libkeepass-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}