{
  description = ''A small but practical concatenative programming language and shell.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-min-v0_8_1.flake = false;
  inputs.src-min-v0_8_1.type = "github";
  inputs.src-min-v0_8_1.owner = "h3rald";
  inputs.src-min-v0_8_1.repo = "min";
  inputs.src-min-v0_8_1.ref = "refs/tags/v0.8.1";
  inputs.src-min-v0_8_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-min-v0_8_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-min-v0_8_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-min-v0_8_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}