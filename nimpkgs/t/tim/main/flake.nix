{
  description = ''Really lightweight template engine'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-tim-main.flake = false;
  inputs.src-tim-main.type = "github";
  inputs.src-tim-main.owner = "openpeep";
  inputs.src-tim-main.repo = "tim";
  inputs.src-tim-main.ref = "refs/heads/main";
  inputs.src-tim-main.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-tim-main, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-tim-main;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-tim-main"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}