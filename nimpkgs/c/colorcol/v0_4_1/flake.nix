{
  description = ''Kakoune plugin for color preview'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-colorcol-v0_4_1.flake = false;
  inputs.src-colorcol-v0_4_1.type = "github";
  inputs.src-colorcol-v0_4_1.owner = "SolitudeSF";
  inputs.src-colorcol-v0_4_1.repo = "colorcol";
  inputs.src-colorcol-v0_4_1.ref = "refs/tags/v0.4.1";
  inputs.src-colorcol-v0_4_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-colorcol-v0_4_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-colorcol-v0_4_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-colorcol-v0_4_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}