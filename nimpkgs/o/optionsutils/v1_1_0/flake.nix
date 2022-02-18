{
  description = ''Utility macros for easier handling of options in Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-optionsutils-v1_1_0.flake = false;
  inputs.src-optionsutils-v1_1_0.type = "github";
  inputs.src-optionsutils-v1_1_0.owner = "PMunch";
  inputs.src-optionsutils-v1_1_0.repo = "nim-optionsutils";
  inputs.src-optionsutils-v1_1_0.ref = "refs/tags/v1.1.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-optionsutils-v1_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-optionsutils-v1_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-optionsutils-v1_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}