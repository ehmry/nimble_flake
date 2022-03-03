{
  description = ''Elegant optional types'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-questionable-main.flake = false;
  inputs.src-questionable-main.type = "github";
  inputs.src-questionable-main.owner = "markspanbroek";
  inputs.src-questionable-main.repo = "questionable";
  inputs.src-questionable-main.ref = "refs/heads/main";
  inputs.src-questionable-main.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-questionable-main, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-questionable-main;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-questionable-main"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}