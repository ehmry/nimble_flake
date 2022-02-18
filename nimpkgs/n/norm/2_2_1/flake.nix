{
  description = ''Nim ORM.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-norm-2_2_1.flake = false;
  inputs.src-norm-2_2_1.type = "github";
  inputs.src-norm-2_2_1.owner = "moigagoo";
  inputs.src-norm-2_2_1.repo = "norm";
  inputs.src-norm-2_2_1.ref = "refs/tags/2.2.1";
  
  
  inputs."ndb".type = "github";
  inputs."ndb".owner = "riinr";
  inputs."ndb".repo = "flake-nimble";
  inputs."ndb".ref = "flake-pinning";
  inputs."ndb".dir = "nimpkgs/n/ndb";

  outputs = { self, nixpkgs, flakeNimbleLib, src-norm-2_2_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-norm-2_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-norm-2_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}