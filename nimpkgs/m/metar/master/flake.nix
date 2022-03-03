{
  description = ''Read metadata from jpeg and tiff images.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-metar-master.flake = false;
  inputs.src-metar-master.type = "github";
  inputs.src-metar-master.owner = "flenniken";
  inputs.src-metar-master.repo = "metar";
  inputs.src-metar-master.ref = "refs/heads/master";
  inputs.src-metar-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-metar-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-metar-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-metar-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}