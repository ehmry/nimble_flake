{
  description = ''A library to automatically encrypt all string constants in your programs'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-strenc-0_1_1.flake = false;
  inputs.src-strenc-0_1_1.type = "github";
  inputs.src-strenc-0_1_1.owner = "Yardanico";
  inputs.src-strenc-0_1_1.repo = "nim-strenc";
  inputs.src-strenc-0_1_1.ref = "refs/tags/0.1.1";
  inputs.src-strenc-0_1_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-strenc-0_1_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-strenc-0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-strenc-0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}