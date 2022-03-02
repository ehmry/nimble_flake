{
  description = ''fast interval overlaps'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-lapper-v0_1_7.flake = false;
  inputs.src-lapper-v0_1_7.type = "github";
  inputs.src-lapper-v0_1_7.owner = "brentp";
  inputs.src-lapper-v0_1_7.repo = "nim-lapper";
  inputs.src-lapper-v0_1_7.ref = "refs/tags/v0.1.7";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-lapper-v0_1_7, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-lapper-v0_1_7;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-lapper-v0_1_7"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}