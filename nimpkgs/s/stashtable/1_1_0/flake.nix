{
  description = ''Concurrent hash table'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-stashtable-1_1_0.flake = false;
  inputs.src-stashtable-1_1_0.type = "github";
  inputs.src-stashtable-1_1_0.owner = "olliNiinivaara";
  inputs.src-stashtable-1_1_0.repo = "StashTable";
  inputs.src-stashtable-1_1_0.ref = "refs/tags/1.1.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-stashtable-1_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-stashtable-1_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-stashtable-1_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}