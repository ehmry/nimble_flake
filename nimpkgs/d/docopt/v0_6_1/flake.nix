{
  description = ''Command-line args parser based on Usage message'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-docopt-v0_6_1.flake = false;
  inputs.src-docopt-v0_6_1.type = "github";
  inputs.src-docopt-v0_6_1.owner = "docopt";
  inputs.src-docopt-v0_6_1.repo = "docopt.nim";
  inputs.src-docopt-v0_6_1.ref = "refs/tags/v0.6.1";
  inputs.src-docopt-v0_6_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-docopt-v0_6_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-docopt-v0_6_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-docopt-v0_6_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}