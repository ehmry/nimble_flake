{
  description = ''Library for splitting a string into shell words'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-shlex-master.flake = false;
  inputs.src-shlex-master.type = "github";
  inputs.src-shlex-master.owner = "SolitudeSF";
  inputs.src-shlex-master.repo = "shlex";
  inputs.src-shlex-master.ref = "refs/heads/master";
  inputs.src-shlex-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-shlex-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-shlex-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-shlex-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}