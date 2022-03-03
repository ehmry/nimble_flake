{
  description = ''Nim - Java bridge'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-jnim-v0_4_1.flake = false;
  inputs.src-jnim-v0_4_1.type = "github";
  inputs.src-jnim-v0_4_1.owner = "yglukhov";
  inputs.src-jnim-v0_4_1.repo = "jnim";
  inputs.src-jnim-v0_4_1.ref = "refs/tags/v0.4.1";
  inputs.src-jnim-v0_4_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-jnim-v0_4_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-jnim-v0_4_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-jnim-v0_4_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}