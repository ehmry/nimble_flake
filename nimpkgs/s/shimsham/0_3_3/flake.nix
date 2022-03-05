{
  description = ''Hashing/Digest collection in pure Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-ShimSham-0_3_3.flake = false;
  inputs.src-ShimSham-0_3_3.type = "github";
  inputs.src-ShimSham-0_3_3.owner = "apense";
  inputs.src-ShimSham-0_3_3.repo = "shimsham";
  inputs.src-ShimSham-0_3_3.ref = "refs/tags/0.3.3";
  inputs.src-ShimSham-0_3_3.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-shimsham-0_3_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-shimsham-0_3_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-shimsham-0_3_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}