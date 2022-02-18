{
  description = ''A Nim package to convert filesizes into other units, and turns filesizes into human readable strings.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-filesize-master.flake = false;
  inputs.src-filesize-master.type = "github";
  inputs.src-filesize-master.owner = "sergiotapia";
  inputs.src-filesize-master.repo = "filesize";
  inputs.src-filesize-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-filesize-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-filesize-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-filesize-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}