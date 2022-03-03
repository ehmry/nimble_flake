{
  description = ''pnm is library for PNM (Portable AnyMap).'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-pnm-master.flake = false;
  inputs.src-pnm-master.type = "github";
  inputs.src-pnm-master.owner = "jiro4989";
  inputs.src-pnm-master.repo = "pnm";
  inputs.src-pnm-master.ref = "refs/heads/master";
  inputs.src-pnm-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-pnm-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-pnm-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-pnm-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}