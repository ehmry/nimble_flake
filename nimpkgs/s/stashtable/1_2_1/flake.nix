{
  description = ''Concurrent hash table'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-stashtable-1_2_1.flake = false;
  inputs.src-stashtable-1_2_1.type = "github";
  inputs.src-stashtable-1_2_1.owner = "olliNiinivaara";
  inputs.src-stashtable-1_2_1.repo = "StashTable";
  inputs.src-stashtable-1_2_1.ref = "refs/tags/1.2.1";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-stashtable-1_2_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-stashtable-1_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-stashtable-1_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}