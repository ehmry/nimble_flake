{
  description = ''minimal, performant mass file renamer'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-rn-v0_0_8.flake = false;
  inputs.src-rn-v0_0_8.type = "github";
  inputs.src-rn-v0_0_8.owner = "xioren";
  inputs.src-rn-v0_0_8.repo = "rn";
  inputs.src-rn-v0_0_8.ref = "refs/tags/v0.0.8";
  inputs.src-rn-v0_0_8.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-rn-v0_0_8, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-rn-v0_0_8;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-rn-v0_0_8"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}