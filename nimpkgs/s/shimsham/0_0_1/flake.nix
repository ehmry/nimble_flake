{
  description = ''Hashing/Digest collection in pure Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-shimsham-0_0_1.flake = false;
  inputs.src-shimsham-0_0_1.type = "github";
  inputs.src-shimsham-0_0_1.owner = "apense";
  inputs.src-shimsham-0_0_1.repo = "shimsham";
  inputs.src-shimsham-0_0_1.ref = "refs/tags/0.0.1";
  inputs.src-shimsham-0_0_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-shimsham-0_0_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-shimsham-0_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-shimsham-0_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}