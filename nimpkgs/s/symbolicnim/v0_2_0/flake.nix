{
  description = ''A symbolic library written purely in Nim with the ability to compile expressions into efficient functions.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-symbolicnim-v0_2_0.flake = false;
  inputs.src-symbolicnim-v0_2_0.type = "github";
  inputs.src-symbolicnim-v0_2_0.owner = "HugoGranstrom";
  inputs.src-symbolicnim-v0_2_0.repo = "symbolicnim";
  inputs.src-symbolicnim-v0_2_0.ref = "refs/tags/v0.2.0";
  inputs.src-symbolicnim-v0_2_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-symbolicnim-v0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-symbolicnim-v0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-symbolicnim-v0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}