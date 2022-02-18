{
  description = ''KDialog Qt5 Wrapper, easy API, KISS design'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."kdialog-master".type = "github";
  inputs."kdialog-master".owner = "riinr";
  inputs."kdialog-master".repo = "flake-nimble";
  inputs."kdialog-master".ref = "flake-pinning";
  inputs."kdialog-master".dir = "nimpkgs/k/kdialog/master";

  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}