{
  description = ''Pretty looking, full featured, Python-inspired unit test library.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs."einheit-master".type = "github";
  inputs."einheit-master".owner = "riinr";
  inputs."einheit-master".repo = "flake-nimble";
  inputs."einheit-master".ref = "flake-pinning";
  inputs."einheit-master".dir = "nimpkgs/e/einheit/master";
  inputs."einheit-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."einheit-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";


  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}