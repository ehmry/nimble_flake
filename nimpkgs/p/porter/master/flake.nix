{
  description = ''Simple extensible implementation of Porter stemmer algorithm'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-porter-master.flake = false;
  inputs.src-porter-master.type = "github";
  inputs.src-porter-master.owner = "iourinski";
  inputs.src-porter-master.repo = "porter";
  inputs.src-porter-master.ref = "refs/heads/master";
  
  
  inputs."mutableseqs".type = "github";
  inputs."mutableseqs".owner = "riinr";
  inputs."mutableseqs".repo = "flake-nimble";
  inputs."mutableseqs".ref = "flake-pinning";
  inputs."mutableseqs".dir = "nimpkgs/m/mutableseqs";

  outputs = { self, nixpkgs, flakeNimbleLib, src-porter-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-porter-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-porter-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}