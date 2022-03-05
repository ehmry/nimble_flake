{
  description = ''A simple decimal library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-simpledecimal-0_1_0.flake = false;
  inputs.src-simpledecimal-0_1_0.type = "github";
  inputs.src-simpledecimal-0_1_0.owner = "pigmej";
  inputs.src-simpledecimal-0_1_0.repo = "nim-simple-decimal";
  inputs.src-simpledecimal-0_1_0.ref = "refs/tags/0.1.0";
  inputs.src-simpledecimal-0_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-simpledecimal-0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-simpledecimal-0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-simpledecimal-0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}