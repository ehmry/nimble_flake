{
  description = ''A library that implements the note.txt specification for note taking.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-notetxt-master.flake = false;
  inputs.src-notetxt-master.type = "github";
  inputs.src-notetxt-master.owner = "mrshu";
  inputs.src-notetxt-master.repo = "nim-notetxt";
  inputs.src-notetxt-master.ref = "refs/heads/master";
  inputs.src-notetxt-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-notetxt-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-notetxt-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-notetxt-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}