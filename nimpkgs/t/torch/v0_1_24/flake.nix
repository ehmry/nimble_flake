{
  description = ''A nim flavor of pytorch'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-torch-v0_1_24.flake = false;
  inputs.src-torch-v0_1_24.type = "github";
  inputs.src-torch-v0_1_24.owner = "fragcolor-xyz";
  inputs.src-torch-v0_1_24.repo = "nimtorch";
  inputs.src-torch-v0_1_24.ref = "refs/tags/v0.1.24";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-torch-v0_1_24, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-torch-v0_1_24;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-torch-v0_1_24"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}