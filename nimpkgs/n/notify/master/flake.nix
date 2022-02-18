{
  description = ''A wrapper to notification libraries'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-notify-master.flake = false;
  inputs.src-notify-master.type = "github";
  inputs.src-notify-master.owner = "xbello";
  inputs.src-notify-master.repo = "notify-nim";
  inputs.src-notify-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-notify-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-notify-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-notify-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}