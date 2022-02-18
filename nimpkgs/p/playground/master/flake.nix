{
  description = ''Web-based playground for testing Nim code.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-playground-master.flake = false;
  inputs.src-playground-master.type = "github";
  inputs.src-playground-master.owner = "theduke";
  inputs.src-playground-master.repo = "nim-playground";
  inputs.src-playground-master.ref = "refs/heads/master";
  
  
  inputs."jester".type = "github";
  inputs."jester".owner = "riinr";
  inputs."jester".repo = "flake-nimble";
  inputs."jester".ref = "flake-pinning";
  inputs."jester".dir = "nimpkgs/j/jester";

  outputs = { self, nixpkgs, flakeNimbleLib, src-playground-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-playground-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-playground-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}