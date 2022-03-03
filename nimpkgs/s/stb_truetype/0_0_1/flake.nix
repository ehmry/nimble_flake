{
  description = ''Nim bindings for stb_truetype.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-stb_truetype-0_0_1.flake = false;
  inputs.src-stb_truetype-0_0_1.type = "github";
  inputs.src-stb_truetype-0_0_1.owner = "guzba";
  inputs.src-stb_truetype-0_0_1.repo = "stb_truetype";
  inputs.src-stb_truetype-0_0_1.ref = "refs/tags/0.0.1";
  inputs.src-stb_truetype-0_0_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-stb_truetype-0_0_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-stb_truetype-0_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-stb_truetype-0_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}