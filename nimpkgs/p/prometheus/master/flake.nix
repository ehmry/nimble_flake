{
  description = ''Library for exposing metrics to Prometheus'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-prometheus-master.flake = false;
  inputs.src-prometheus-master.type = "github";
  inputs.src-prometheus-master.owner = "dom96";
  inputs.src-prometheus-master.repo = "prometheus";
  inputs.src-prometheus-master.ref = "refs/heads/master";
  inputs.src-prometheus-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-prometheus-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-prometheus-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-prometheus-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}