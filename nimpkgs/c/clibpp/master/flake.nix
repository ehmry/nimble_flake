{
  description = ''Easy way to 'Mock' C++ interface'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-clibpp-master.flake = false;
  inputs.src-clibpp-master.type = "github";
  inputs.src-clibpp-master.owner = "onionhammer";
  inputs.src-clibpp-master.repo = "clibpp";
  inputs.src-clibpp-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-clibpp-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-clibpp-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-clibpp-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}