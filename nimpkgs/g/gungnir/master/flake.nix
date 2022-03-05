{
  description = ''Cryptographic signing for Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-gungnir-master.flake = false;
  inputs.src-gungnir-master.type = "github";
  inputs.src-gungnir-master.owner = "planety";
  inputs.src-gungnir-master.repo = "gungnir";
  inputs.src-gungnir-master.ref = "refs/heads/master";
  inputs.src-gungnir-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-gungnir-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-gungnir-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-gungnir-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}