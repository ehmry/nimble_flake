{
  description = ''Elegant optional types'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-questionable-0_8_0.flake = false;
  inputs.src-questionable-0_8_0.type = "github";
  inputs.src-questionable-0_8_0.owner = "markspanbroek";
  inputs.src-questionable-0_8_0.repo = "questionable";
  inputs.src-questionable-0_8_0.ref = "refs/tags/0.8.0";
  inputs.src-questionable-0_8_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-questionable-0_8_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-questionable-0_8_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-questionable-0_8_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}