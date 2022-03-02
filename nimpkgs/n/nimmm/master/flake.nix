{
  description = ''A terminal file manager written in nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimmm-master.flake = false;
  inputs.src-nimmm-master.type = "github";
  inputs.src-nimmm-master.owner = "joachimschmidt557";
  inputs.src-nimmm-master.repo = "nimmm";
  inputs.src-nimmm-master.ref = "refs/heads/master";
  
  
  inputs."noise".type = "github";
  inputs."noise".owner = "riinr";
  inputs."noise".repo = "flake-nimble";
  inputs."noise".ref = "flake-pinning";
  inputs."noise".dir = "nimpkgs/n/noise";

  
  inputs."nimbox".type = "github";
  inputs."nimbox".owner = "riinr";
  inputs."nimbox".repo = "flake-nimble";
  inputs."nimbox".ref = "flake-pinning";
  inputs."nimbox".dir = "nimpkgs/n/nimbox";

  
  inputs."lscolors".type = "github";
  inputs."lscolors".owner = "riinr";
  inputs."lscolors".repo = "flake-nimble";
  inputs."lscolors".ref = "flake-pinning";
  inputs."lscolors".dir = "nimpkgs/l/lscolors";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimmm-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimmm-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimmm-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}