{
  description = ''BPG (Better Portable Graphics) for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-bpg-master.flake = false;
  inputs.src-bpg-master.type = "github";
  inputs.src-bpg-master.owner = "def-";
  inputs.src-bpg-master.repo = "nim-bpg";
  inputs.src-bpg-master.ref = "refs/heads/master";
  inputs.src-bpg-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-bpg-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-bpg-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-bpg-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}