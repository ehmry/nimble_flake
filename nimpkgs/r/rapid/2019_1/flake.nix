{
  description = ''A game engine for rapid development and easy prototyping'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-rapid-2019_1.flake = false;
  inputs.src-rapid-2019_1.type = "github";
  inputs.src-rapid-2019_1.owner = "liquid600pgm";
  inputs.src-rapid-2019_1.repo = "rapid";
  inputs.src-rapid-2019_1.ref = "refs/tags/2019.1";
  inputs.src-rapid-2019_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-rapid-2019_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-rapid-2019_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-rapid-2019_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}