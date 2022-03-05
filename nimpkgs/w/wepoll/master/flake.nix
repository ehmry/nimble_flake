{
  description = ''Windows epoll wrapper.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-wepoll-master.flake = false;
  inputs.src-wepoll-master.type = "github";
  inputs.src-wepoll-master.owner = "xflywind";
  inputs.src-wepoll-master.repo = "wepoll";
  inputs.src-wepoll-master.ref = "refs/heads/master";
  inputs.src-wepoll-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-wepoll-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-wepoll-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-wepoll-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}