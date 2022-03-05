{
  description = ''Obsolete - please use egl instead!'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-io-egl-master.flake = false;
  inputs.src-io-egl-master.type = "github";
  inputs.src-io-egl-master.owner = "nimious";
  inputs.src-io-egl-master.repo = "io-egl";
  inputs.src-io-egl-master.ref = "refs/heads/master";
  inputs.src-io-egl-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-io-egl-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-io-egl-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-io-egl-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}