{
  description = ''API for Web Audio (JS)'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-webaudio-master.flake = false;
  inputs.src-webaudio-master.type = "github";
  inputs.src-webaudio-master.owner = "ftsf";
  inputs.src-webaudio-master.repo = "nim-webaudio";
  inputs.src-webaudio-master.ref = "refs/heads/master";
  inputs.src-webaudio-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-webaudio-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-webaudio-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-webaudio-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}