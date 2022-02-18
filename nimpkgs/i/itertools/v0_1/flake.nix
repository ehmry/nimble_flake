{
  description = ''Itertools for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-itertools-v0_1.flake = false;
  inputs.src-itertools-v0_1.type = "github";
  inputs.src-itertools-v0_1.owner = "narimiran";
  inputs.src-itertools-v0_1.repo = "itertools";
  inputs.src-itertools-v0_1.ref = "refs/tags/v0.1";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-itertools-v0_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-itertools-v0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-itertools-v0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}