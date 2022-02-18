{
  description = ''libmagic for nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-magic-master.flake = false;
  inputs.src-magic-master.type = "github";
  inputs.src-magic-master.owner = "xmonader";
  inputs.src-magic-master.repo = "nim-magic";
  inputs.src-magic-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-magic-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-magic-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-magic-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}