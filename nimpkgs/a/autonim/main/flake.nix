{
  description = ''Wrapper for AutoIt v3.3.14.2'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-autonim-main.flake = false;
  inputs.src-autonim-main.type = "github";
  inputs.src-autonim-main.owner = "Guevara-chan";
  inputs.src-autonim-main.repo = "AutoNim";
  inputs.src-autonim-main.ref = "refs/heads/main";
  inputs.src-autonim-main.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-autonim-main, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-autonim-main;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-autonim-main"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}