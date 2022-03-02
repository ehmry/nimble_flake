{
  description = ''Least recently used (LRU) cache'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-lrucache-1_0_4.flake = false;
  inputs.src-lrucache-1_0_4.type = "github";
  inputs.src-lrucache-1_0_4.owner = "jackhftang";
  inputs.src-lrucache-1_0_4.repo = "lrucache";
  inputs.src-lrucache-1_0_4.ref = "refs/tags/1.0.4";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-lrucache-1_0_4, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-lrucache-1_0_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-lrucache-1_0_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}