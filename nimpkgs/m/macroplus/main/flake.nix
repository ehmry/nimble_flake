{
  description = ''a collection of useful macro functionalities'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-macroplus-main.flake = false;
  inputs.src-macroplus-main.type = "github";
  inputs.src-macroplus-main.owner = "hamidb80";
  inputs.src-macroplus-main.repo = "macroplus";
  inputs.src-macroplus-main.ref = "refs/heads/main";
  inputs.src-macroplus-main.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-macroplus-main, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-macroplus-main;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-macroplus-main"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}