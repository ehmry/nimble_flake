{
  description = ''Simple DNS Client & Library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-dnsclient-master.flake = false;
  inputs.src-dnsclient-master.type = "github";
  inputs.src-dnsclient-master.owner = "ba0f3";
  inputs.src-dnsclient-master.repo = "dnsclient.nim";
  inputs.src-dnsclient-master.ref = "refs/heads/master";
  inputs.src-dnsclient-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-dnsclient-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-dnsclient-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-dnsclient-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}