{
  description = ''Cross platform system API for os and net.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-xio-master.flake = false;
  inputs.src-xio-master.type = "github";
  inputs.src-xio-master.owner = "xflywind";
  inputs.src-xio-master.repo = "async";
  inputs.src-xio-master.ref = "refs/heads/master";
  inputs.src-xio-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-xio-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-xio-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-xio-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}