{
  description = ''Nim wrappers for ESP-IDF (ESP32)'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nesper-v0_4_1.flake = false;
  inputs.src-nesper-v0_4_1.type = "github";
  inputs.src-nesper-v0_4_1.owner = "elcritch";
  inputs.src-nesper-v0_4_1.repo = "nesper";
  inputs.src-nesper-v0_4_1.ref = "refs/tags/v0.4.1";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nesper-v0_4_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nesper-v0_4_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nesper-v0_4_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}