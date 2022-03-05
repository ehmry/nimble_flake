{
  description = ''A Nim implementation of Simon Cooke's Bip Buffer. A type of circular buffer ensuring contiguous blocks of memory'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-bipbuffer-master.flake = false;
  inputs.src-bipbuffer-master.type = "github";
  inputs.src-bipbuffer-master.owner = "MarcAzar";
  inputs.src-bipbuffer-master.repo = "BipBuffer";
  inputs.src-bipbuffer-master.ref = "refs/heads/master";
  inputs.src-bipbuffer-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-BipBuffer-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-BipBuffer-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-BipBuffer-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}