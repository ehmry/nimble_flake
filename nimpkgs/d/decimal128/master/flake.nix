{
  description = ''Decimal type support based on the IEEE 754 2008 specification.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-decimal128-master.flake = false;
  inputs.src-decimal128-master.type = "github";
  inputs.src-decimal128-master.owner = "JohnAD";
  inputs.src-decimal128-master.repo = "decimal128";
  inputs.src-decimal128-master.ref = "refs/heads/master";
  inputs.src-decimal128-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-decimal128-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-decimal128-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-decimal128-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}