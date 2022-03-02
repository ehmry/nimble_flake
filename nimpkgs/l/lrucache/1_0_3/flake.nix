{
  description = ''Least recently used (LRU) cache'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-lrucache-1_0_3.flake = false;
  inputs.src-lrucache-1_0_3.type = "github";
  inputs.src-lrucache-1_0_3.owner = "jackhftang";
  inputs.src-lrucache-1_0_3.repo = "lrucache";
  inputs.src-lrucache-1_0_3.ref = "refs/tags/1.0.3";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-lrucache-1_0_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-lrucache-1_0_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-lrucache-1_0_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}