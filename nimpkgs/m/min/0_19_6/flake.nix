{
  description = ''A small but practical concatenative programming language and shell.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-min-0_19_6.flake = false;
  inputs.src-min-0_19_6.type = "github";
  inputs.src-min-0_19_6.owner = "h3rald";
  inputs.src-min-0_19_6.repo = "min";
  inputs.src-min-0_19_6.ref = "refs/tags/0.19.6";
  inputs.src-min-0_19_6.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-min-0_19_6, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-min-0_19_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-min-0_19_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}