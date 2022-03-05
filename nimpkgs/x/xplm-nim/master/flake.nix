{
  description = ''X-Plane XPLM SDK wrapper'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-XPLM-Nim-master.flake = false;
  inputs.src-XPLM-Nim-master.type = "github";
  inputs.src-XPLM-Nim-master.owner = "jpoirier";
  inputs.src-XPLM-Nim-master.repo = "XPLM-Nim";
  inputs.src-XPLM-Nim-master.ref = "refs/heads/master";
  inputs.src-XPLM-Nim-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-XPLM-Nim-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-XPLM-Nim-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-XPLM-Nim-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}