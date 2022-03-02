{
  description = ''Nim interface to gnuplot'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-gnuplot-master.flake = false;
  inputs.src-gnuplot-master.type = "github";
  inputs.src-gnuplot-master.owner = "dvolk";
  inputs.src-gnuplot-master.repo = "gnuplot.nim";
  inputs.src-gnuplot-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-gnuplot-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-gnuplot-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-gnuplot-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}