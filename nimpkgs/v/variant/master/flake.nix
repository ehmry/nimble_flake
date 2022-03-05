{
  description = ''Variant type and type matching'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-variant-master.flake = false;
  inputs.src-variant-master.type = "github";
  inputs.src-variant-master.owner = "yglukhov";
  inputs.src-variant-master.repo = "variant";
  inputs.src-variant-master.ref = "refs/heads/master";
  inputs.src-variant-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-variant-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-variant-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-variant-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}