{
  description = ''Static blog generator ala Jekyll.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."ipsumgenera-master".type = "github";
  inputs."ipsumgenera-master".owner = "riinr";
  inputs."ipsumgenera-master".repo = "flake-nimble";
  inputs."ipsumgenera-master".ref = "flake-pinning";
  inputs."ipsumgenera-master".dir = "nimpkgs/i/ipsumgenera/master";

  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}