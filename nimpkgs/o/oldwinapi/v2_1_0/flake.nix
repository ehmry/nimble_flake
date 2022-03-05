{
  description = ''Old Win API library for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-oldwinapi-v2_1_0.flake = false;
  inputs.src-oldwinapi-v2_1_0.type = "github";
  inputs.src-oldwinapi-v2_1_0.owner = "nim-lang";
  inputs.src-oldwinapi-v2_1_0.repo = "oldwinapi";
  inputs.src-oldwinapi-v2_1_0.ref = "refs/tags/v2.1.0";
  inputs.src-oldwinapi-v2_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-oldwinapi-v2_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-oldwinapi-v2_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-oldwinapi-v2_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}