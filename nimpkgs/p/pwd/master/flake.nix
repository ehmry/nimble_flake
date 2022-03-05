{
  description = ''Nim port of Python's pwd module for working with the UNIX password file'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-pwd-master.flake = false;
  inputs.src-pwd-master.type = "github";
  inputs.src-pwd-master.owner = "achesak";
  inputs.src-pwd-master.repo = "nim-pwd";
  inputs.src-pwd-master.ref = "refs/heads/master";
  inputs.src-pwd-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-pwd-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pwd-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-pwd-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}