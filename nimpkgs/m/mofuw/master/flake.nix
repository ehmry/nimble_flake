{
  description = ''mofuw is *MO*re *F*aster, *U*ltra *W*ebserver'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-mofuw-master.flake = false;
  inputs.src-mofuw-master.type = "github";
  inputs.src-mofuw-master.owner = "2vg";
  inputs.src-mofuw-master.repo = "mofuw";
  inputs.src-mofuw-master.ref = "refs/heads/master";
  
  
  inputs."https://github.com/2vg/mofuparser".type = "github";
  inputs."https://github.com/2vg/mofuparser".owner = "riinr";
  inputs."https://github.com/2vg/mofuparser".repo = "flake-nimble";
  inputs."https://github.com/2vg/mofuparser".ref = "flake-pinning";
  inputs."https://github.com/2vg/mofuparser".dir = "nimpkgs/h/https://github.com/2vg/mofuparser";

  
  inputs."https://github.com/2vg/mofuhttputils".type = "github";
  inputs."https://github.com/2vg/mofuhttputils".owner = "riinr";
  inputs."https://github.com/2vg/mofuhttputils".repo = "flake-nimble";
  inputs."https://github.com/2vg/mofuhttputils".ref = "flake-pinning";
  inputs."https://github.com/2vg/mofuhttputils".dir = "nimpkgs/h/https://github.com/2vg/mofuhttputils";

  outputs = { self, nixpkgs, flakeNimbleLib, src-mofuw-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-mofuw-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-mofuw-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}