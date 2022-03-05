{
  description = ''String interpolation with printf syntax'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-stringinterpolation-master.flake = false;
  inputs.src-stringinterpolation-master.type = "github";
  inputs.src-stringinterpolation-master.owner = "bluenote10";
  inputs.src-stringinterpolation-master.repo = "nim-stringinterpolation";
  inputs.src-stringinterpolation-master.ref = "refs/heads/master";
  inputs.src-stringinterpolation-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-stringinterpolation-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-stringinterpolation-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-stringinterpolation-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}