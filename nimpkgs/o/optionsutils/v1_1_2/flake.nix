{
  description = ''Utility macros for easier handling of options in Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-optionsutils-v1_1_2.flake = false;
  inputs.src-optionsutils-v1_1_2.type = "github";
  inputs.src-optionsutils-v1_1_2.owner = "PMunch";
  inputs.src-optionsutils-v1_1_2.repo = "nim-optionsutils";
  inputs.src-optionsutils-v1_1_2.ref = "refs/tags/v1.1.2";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-optionsutils-v1_1_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-optionsutils-v1_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-optionsutils-v1_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}