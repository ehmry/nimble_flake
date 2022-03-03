{
  description = ''Nim modules for access to system Bluetooth resources.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimbluez-v0_1_0.flake = false;
  inputs.src-nimbluez-v0_1_0.type = "github";
  inputs.src-nimbluez-v0_1_0.owner = "Electric-Blue";
  inputs.src-nimbluez-v0_1_0.repo = "NimBluez";
  inputs.src-nimbluez-v0_1_0.ref = "refs/tags/v0.1.0";
  inputs.src-nimbluez-v0_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimbluez-v0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimbluez-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimbluez-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}