{
  description = ''REXPaint .xp parser'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-rexpaint-master.flake = false;
  inputs.src-rexpaint-master.type = "github";
  inputs.src-rexpaint-master.owner = "irskep";
  inputs.src-rexpaint-master.repo = "rexpaint_nim";
  inputs.src-rexpaint-master.ref = "refs/heads/master";
  
  
  inputs."zip".type = "github";
  inputs."zip".owner = "riinr";
  inputs."zip".repo = "flake-nimble";
  inputs."zip".ref = "flake-pinning";
  inputs."zip".dir = "nimpkgs/z/zip";

  outputs = { self, nixpkgs, flakeNimbleLib, src-rexpaint-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-rexpaint-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-rexpaint-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}