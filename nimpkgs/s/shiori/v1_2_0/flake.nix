{
  description = ''SHIORI Protocol Parser/Builder'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-shiori-v1_2_0.flake = false;
  inputs.src-shiori-v1_2_0.type = "github";
  inputs.src-shiori-v1_2_0.owner = "Narazaka";
  inputs.src-shiori-v1_2_0.repo = "shiori-nim";
  inputs.src-shiori-v1_2_0.ref = "refs/tags/v1.2.0";
  inputs.src-shiori-v1_2_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-shiori-v1_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-shiori-v1_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-shiori-v1_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}