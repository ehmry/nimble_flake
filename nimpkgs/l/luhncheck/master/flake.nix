{
  description = ''Implementation of Luhn algorithm in nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-luhncheck-master.flake = false;
  inputs.src-luhncheck-master.type = "github";
  inputs.src-luhncheck-master.owner = "sillibird";
  inputs.src-luhncheck-master.repo = "luhncheck";
  inputs.src-luhncheck-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-luhncheck-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-luhncheck-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-luhncheck-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}