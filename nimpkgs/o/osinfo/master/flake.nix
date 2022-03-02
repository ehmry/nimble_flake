{
  description = ''Modules providing information about the OS.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-osinfo-master.flake = false;
  inputs.src-osinfo-master.type = "github";
  inputs.src-osinfo-master.owner = "nim-lang";
  inputs.src-osinfo-master.repo = "osinfo";
  inputs.src-osinfo-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-osinfo-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-osinfo-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-osinfo-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}