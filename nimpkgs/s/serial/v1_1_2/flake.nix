{
  description = ''A library to operate serial ports using pure Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-serial-v1_1_2.flake = false;
  inputs.src-serial-v1_1_2.type = "github";
  inputs.src-serial-v1_1_2.owner = "euantorano";
  inputs.src-serial-v1_1_2.repo = "serial.nim";
  inputs.src-serial-v1_1_2.ref = "refs/tags/v1.1.2";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-serial-v1_1_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-serial-v1_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-serial-v1_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}