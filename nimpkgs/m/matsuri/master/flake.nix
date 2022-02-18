{
  description = ''Useful Variant Type and Powerful Pattern Matching for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-matsuri-master.flake = false;
  inputs.src-matsuri-master.type = "github";
  inputs.src-matsuri-master.owner = "zer0-star";
  inputs.src-matsuri-master.repo = "matsuri";
  inputs.src-matsuri-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-matsuri-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-matsuri-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-matsuri-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}