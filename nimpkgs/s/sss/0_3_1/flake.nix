{
  description = ''Shamir secret sharing'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-sss-0_3_1.flake = false;
  inputs.src-sss-0_3_1.type = "github";
  inputs.src-sss-0_3_1.owner = "markspanbroek";
  inputs.src-sss-0_3_1.repo = "sss.nim";
  inputs.src-sss-0_3_1.ref = "refs/tags/0.3.1";
  inputs.src-sss-0_3_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-sss-0_3_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-sss-0_3_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-sss-0_3_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}