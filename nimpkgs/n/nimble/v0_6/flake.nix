{
  description = ''Nimble package manager'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimble-v0_6.flake = false;
  inputs.src-nimble-v0_6.type = "github";
  inputs.src-nimble-v0_6.owner = "nim-lang";
  inputs.src-nimble-v0_6.repo = "nimble";
  inputs.src-nimble-v0_6.ref = "refs/tags/v0.6";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimble-v0_6, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimble-v0_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimble-v0_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}