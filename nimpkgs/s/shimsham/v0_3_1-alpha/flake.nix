{
  description = ''Hashing/Digest collection in pure Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-shimsham-v0_3_1-alpha.flake = false;
  inputs.src-shimsham-v0_3_1-alpha.type = "github";
  inputs.src-shimsham-v0_3_1-alpha.owner = "apense";
  inputs.src-shimsham-v0_3_1-alpha.repo = "shimsham";
  inputs.src-shimsham-v0_3_1-alpha.ref = "refs/tags/v0.3.1-alpha";
  inputs.src-shimsham-v0_3_1-alpha.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-shimsham-v0_3_1-alpha, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-shimsham-v0_3_1-alpha;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-shimsham-v0_3_1-alpha"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}