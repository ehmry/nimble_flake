{
  description = ''The SHIORI DLL interface'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-shioridll-v1_0_1.flake = false;
  inputs.src-shioridll-v1_0_1.type = "github";
  inputs.src-shioridll-v1_0_1.owner = "Narazaka";
  inputs.src-shioridll-v1_0_1.repo = "shioridll-nim";
  inputs.src-shioridll-v1_0_1.ref = "refs/tags/v1.0.1";
  inputs.src-shioridll-v1_0_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-shioridll-v1_0_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-shioridll-v1_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-shioridll-v1_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}